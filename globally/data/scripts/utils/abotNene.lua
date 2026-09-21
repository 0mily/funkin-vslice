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

    addLuaSprite('abot', false);
end

function createVisualizer()
    -- eu faço isso outro dia sei lá
end

function onBeatHit()
    playAnim('abot', 'idle', true);
end