--[[

* IT FUCKS UP THE STEREO FOR SOME REASON, AND IM STILL CONFUSE ABOUT IT???

ITS FUCKING 4 AM ATP I CANT SLEEP AND I'M NOT DOIN THAT



local can = false
local dangerThing = false

function onLoadPost()
    if string.find(string.lower(gfName), 'nene') then
        can = true
    end
end

function onUpdatePost()
    --debugPrint('Nene: ' .. toString(can) .. ' || Danger: ' .. toString(dangerThing));

    local curHealth = getHealth();

    if curHealth < 0.4 and not dangerThing then
        dangerThing = true
        playAnim('gf', 'raiseKnife', true);
        setProperty('gf.specialAnim', true);   -- should i use the util reference thing? Ashley helpme i love just typin gf.var = value; AAAAAA

    elseif curHealth >= 0.4 and dangerThing then
        dangerThing = false
        playAnim('gf', 'lowerKnife', true);
        setProperty('gf.specialAnim', true);
    end
end

function onUpdate()
    local animFinished = getProperty('gf.animation.curAnim.finished')

    if dangerThing and animFinished then
            local animName = getProperty('gf.animation.curAnim.name')
        if animName == 'raiseKnife' or animName == 'idleKnife' then
            playAnim('gf', 'idleKnife', true);
            setProperty('gf.specialAnim', true);
            
        end
    end
end
]]