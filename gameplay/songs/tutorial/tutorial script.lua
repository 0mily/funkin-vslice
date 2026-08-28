local sourcecamera = false

function onMoveCamera(character)
    if sourcecamera then return end

    local zum = 1.16

    if character == 'gf' then
        zum = 1
    end

    local curZoom = getProperty('defaultCamZoom')

    if curZoom ~= zum then
        sourcecamera = true

        setProperty('defaultCamZoom', zum)

        doTweenZoom('AAAAAAAAA', 'camGame', zum, (stepCrochet * 4 / 1000), 'elasticInOut')
    end
end

function onTweenCompleted(tag)
    if tag == 'AAAAAAAAA' then
        sourcecamera = false
    end
end