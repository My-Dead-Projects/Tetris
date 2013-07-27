
ctx = $('#game')[0].getContext('2d')

drawBrick = (x, y) ->
    ctx.fillRect((x-1)*40+2, (y-1)*40+2, 38, 38)

drawLine = (x, y, rot) ->
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

clearScreen = ->
    ctx.clearRect(0, 0, 400, 800)

# test code:

pos = 1
rot = 0
setInterval( ->
    clearScreen()
    drawLine(5, pos, rot)
    pos += 1
    rot += 1
, 1000)
