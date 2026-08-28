-- This script is used to give points for holding sustain notes, just like Vslice.

local sustainTime = 0
local sustainGrace = 0

function goodNoteHit(id, direction, noteType, isSustainNote)
    if isSustainNote then
        sustainGrace = 0.15
    end
end

function onUpdate(e)

    if sustainGrace > 0 then
        sustainGrace = sustainGrace - e
        sustainTime = sustainTime + e

        local pointsToAdd = 0

        while sustainTime >= 0.03 do
            sustainTime = sustainTime - 0.03
            pointsToAdd = pointsToAdd + 1
        end

        if pointsToAdd > 0 then
            addScore(pointsToAdd)
        end
    else
        sustainTime = 0
    end

end