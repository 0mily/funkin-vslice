function onLoad()
    if string.find(string.lower(gfName), 'nene') then
        createAbot();
        createVisualizer();
    end
end

function createAbot()
    local x = getProperty('gf.x') - 140
    local y = getProperty('gf.y') + 380

    makeAtlasSprite('abot', x, y, 'chrs/nene/abot/main/system');
    addAnim('abot', 'idle', 'abot', 24, false);
    setScrollFactor('abot', 0.95, 0.95); -- changing later

    makeLuaSprite('stereo','chrs/nene/abot/main/stereo-bg', x + 150, y + 30);
    setScrollFactor('stereo', 0.95, 0.95, true);
    scaleObject('stereo', 1.03, 1.03);
    addLuaSprite('stereo',false);
    addLuaSprite('abot', false);
end

function createVisualizer()
    local x = getProperty('abot.x') + 70
    local y = getProperty('abot.y') + 20

    runHaxeCode([[ 
        import funkin.vis.dsp.SpectralAnalyzer; // lol

        var abotvizGroup = new FlxSpriteGroup(]] .. x .. [[, ]] .. y .. [[);
        var abotvizSprites = [];
        var abotvizLevels = null;
        var abotvizThing = null;
        var abotvizX = [0, 59, 56, 66, 54, 52, 51];
        var abotvizY = [0, -8, -3.5, -0.4, 0.5, 4.7, 7];
        var abotvizFrames = Paths.getSparrowAtlas('chrs/nene/abot/main/abot-viz');
        var luaname = game.getLuaObject('abot'); // i hate how this is made

        var abotLua:Int = game.members.indexOf(luaname);

        var vizX = 0.0;
        var vizY = 0.0;
        for (i in 0...7)
        {
            vizX += abotvizX[i];
            vizY += abotvizY[i];

            var viz = new FlxSprite(vizX + 140, vizY + 74);
            viz.frames = abotvizFrames;
            viz.animation.addByPrefix('VIZ', 'viz' + (i + 1), 0, false);
            viz.animation.play('VIZ', true);
            viz.animation.curAnim.curFrame = 5;
            viz.antialiasing = ClientPrefs.data.antialiasing;
            viz.updateHitbox();
            viz.centerOffsets();
            abotvizSprites.push(viz);
            abotvizGroup.add(viz);
        }

        abotvizGroup.scrollFactor.set(0.95, 0.95);

        game.insert(abotLua, abotvizGroup);

        function updateVizualizer()
        {
            if (abotvizThing == null)
            {
                var music = FlxG.sound.music;
                if (music == null || music._channel == null || music._channel.__audioSource == null)
                    return;

                @:privateAccess
                abotvizThing = new SpectralAnalyzer(music._channel.__audioSource, 7, 0.1, 40);
                #if desktop
                abotvizThing.fftN = 256;
                #end
            }

            abotvizLevels = abotvizThing.getLevels(abotvizLevels);
            for (i in 0...Std.int(Math.min(abotvizSprites.length, abotvizLevels.length)))
            {
                var frame = Math.round(abotvizLevels[i].value * 5);
                frame = Std.int(Math.abs(FlxMath.bound(frame, 0, 5) - 5));
                abotvizSprites[i].animation.curAnim.curFrame = frame;
            }
        }
    ]]);
end

function onUpdate(elapsed)
    runHaxeFunction('updateVizualizer');
end

function onBeatHit()
    playAnim('abot', 'idle', true);
end