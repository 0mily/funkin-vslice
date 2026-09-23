function onLoad()
    runHaxeCode([[
        import flixel.util.FlxStringUtil;

        function formatNumber(value:Int){
            return FlxStringUtil.formatMoney(value, false);
        }
    ]])
end

function onLoadPost()
    HealthBarColor()
    Functionalities()
end

function HealthBarColor() -- modding
    local OpponentColor = 'FF0000'
    local PlayerColor = '66FF33'
    setHealthBarColors(OpponentColor, PlayerColor)
end

function Functionalities()
    setPropertyFromClass('backend.ClientPrefs', 'data.comboOffset', {50, 50, 95, 120}) -- is this really necessary? -Shiho
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
    if not botPlay then
        updateCustomScore()
    end
end

function updateCustomScore()
    local commaScore = runHaxeFunction('formatNumber', {score})
    if not botPlay then
        setTextString('scoreTxt', getTranslationPhrase('vslice_score', 'Score: {1}', {commaScore}))
    else
        setTextString('scoreTxt', getTranslationPhrase('vslice_botplay', 'Bot Play enabled'))
    end
end