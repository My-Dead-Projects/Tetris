
ctx = $('#game')[0].getContext('2d')

class Brick
    constructor: (@x, @y, @color) ->

board = []

drawBoard = () ->
    for brick in board
        ctx.fillStyle = brick.color
        ctx.fillRect((brick.x-1)*40+2, (brick.y-1)*40+2, 38, 38)

addBrick = (x, y, color) ->
    board.push new Brick(x, y, color)

drawLine = (x, y, rot) ->
    c = "#48f"
    if !(rot % 2)
        for i in [-1..2]
            addBrick(x+i, y, c)
    else
        for i in [-1..2]
            addBrick(x, y+i, c)
    drawBoard()

drawLL = (x, y, rot) ->
    
    for i in [-1..2]
        if i < 2
            c = "#00f"
            if rot % 2
                addBrick(x, y+i, c)
            else
                addBrick(x+i, y, c)
        else
            c = "#f00"
            if rot % 2 == 0
                addBrick(x+i-(rot%4+1), y+((rot%4)*1-1), c)
            else
                addBrick(x+((rot%4)*-1+2), y+i-(rot%4+0), c)
    drawBoard()

clearBoard = ->
    board = []
    ctx.clearRect(0, 0, 400, 800)

# test code:

test = (f) ->
    pos = 2
    rot = 0
    setInterval( ->
        clearBoard()
        f(5, pos, rot)
        #if rot % 5 == 4
            #pos += 1
        rot += 1
        if pos == 20
            pos = 2
    , 500)

test(drawLL)
