function onCreatePost()
    HealthBarColor()
    Functionalities()
end

function HealthBarColor()
    local OpponentColor = 'FF0000'
    local PlayerColor = '66FF33'
    setHealthBarColors(OpponentColor, PlayerColor)
end

function Functionalities()

    setPropertyFromClass('backend.ClientPrefs', 'data.comboOffset', {50, 50, 95, 120})
    setProperty('scoreTxt.fieldWidth', 0)
    setProperty('scoreTxt.x', getProperty('healthBar.x') + getProperty('healthBar.width') - 190)
    setProperty('scoreTxt.y', getProperty('healthBar.y') + 30)

    setProperty('botplayTxt.visible', false)
    setProperty('timeTxt.visible', false)
    setProperty('timeBar.visible', false)

    setProperty('healthBar.smoothSpeed', 15)
    setProperty('healthBar.smooth', true)

    setTextFont('scoreTxt', 'vcr.ttf')
    setTextSize('scoreTxt', 16)
    setTextAlignment('scoreTxt', 'right')
    setTextBorder('scoreTxt', 1, '000000')

    updateCustomScore()
end

function onUpdate(e)
    updateCustomScore()
end

function formatNumber(value)
    local negative = value < 0
    local mathForm = tostring(math.floor(math.abs(value)))
    local replace

    repeat
        mathForm, replace =
            mathForm:gsub('^(%d+)(%d%d%d)', '%1,%2')
    until replace == 0

    if negative then
        mathForm = '-' .. mathForm
    end

    return mathForm
end

function updateCustomScore()
    local commaScore = formatNumber(getProperty('songScore'))
    setTextString('scoreTxt', 'Score: ' .. commaScore)
end