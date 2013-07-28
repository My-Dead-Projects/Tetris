
ctx = $('#game')[0].getContext('2d')

drawBrick = (x, y) ->
    ctx.fillRect((x-1)*40+2, (y-1)*40+2, 38, 38)

drawLine = (x, y, rot) ->
    ctx.fillStyle = "#48f"
    if !(rot % 2)
        drawBrick(x, y-1)
        drawBrick(x, y)
        drawBrick(x, y+1)
        drawBrick(x, y+2)
    else
        drawBrick(x-1, y)
        drawBrick(x, y)
        drawBrick(x+1, y)
        drawBrick(x+2, y)

drawRL = (x, y, rot) ->
    ctx.fillStyle = "#00f"
    if rot % 4 == 0
        drawBrick(x, y+1)
        drawBrick(x, y)
        drawBrick(x, y-1)
        drawBrick(x+1, y-1)
    if rot % 4 == 1
        drawBrick(x-1, y)
        drawBrick(x, y)
        drawBrick(x+1, y)
        drawBrick(x+1, y+1)
    if rot % 4 == 2
        drawBrick(x, y-1)
        drawBrick(x, y)
        drawBrick(x, y+1)
        drawBrick(x-1, y+1)
    if rot % 4 == 3
        drawBrick(x-1, y-1)
        drawBrick(x-1, y)
        drawBrick(x, y)
        drawBrick(x+1, y)

clearScreen = ->
    ctx.clearRect(0, 0, 400, 800)

# test code:

test = (f) ->
    pos = 2
    rot = 0
    setInterval( ->
        clearScreen()
        f(5, pos, rot)
        if rot % 5 == 4
            pos += 1
        rot += 1
        if pos == 20
            pos = 2
    , 500)

test(drawLine)
