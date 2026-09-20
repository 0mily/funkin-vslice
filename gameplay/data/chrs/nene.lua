

function onLoad()
    createAbot();
end

function onSongStart()
    playAbot();
end




function createAbot()
    makeAtlasSprite('abot', -5.5, -126, 'chrs/nene/abot/main/system');
    addAnim('abot', 'idle', 'abot speaker', 24, false);
        
    addLuaSprite('abot', false);
end


function playAbot()
    playAnim('abot', 'idle', true);
end