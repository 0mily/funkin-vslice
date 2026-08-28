-- This script is used to show the combo number when the player reaches 10 combo.

function onUpdate()
    if combo >= 10 then
        setProperty("showComboNum", true)
    else
        setProperty("showComboNum", false)
    end
end