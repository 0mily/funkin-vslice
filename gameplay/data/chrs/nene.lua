local nX = getProperty('gf.x');
local nY = getProperty('gf.y');

function onLoad()
    createAbot();
end

function onSongStart()
    playAbot();
end




function createAbot()
    makeAnimatedLuaSprite('abot', 'chrs/nene/abot/main/abot-sparrow', nX, nY);
    addAnimationByPrefix('abot', 'idle', 'abot', 24, false);
    setScrollFactor('abot', 0.95, 0.95);
        
    addLuaSprite('abot', false);
end


function playAbot()
    --playAnim('abot', 'idle', true);
end