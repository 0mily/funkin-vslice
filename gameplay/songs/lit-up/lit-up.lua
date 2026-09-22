function onBeatHit()
    -- Plays the easter egg thing
    if curBeat == 210 and getRandomBool(32) then
        callOnLuas('broEasterEgg', {})
        
    end
end