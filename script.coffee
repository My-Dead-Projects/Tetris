
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
    c = "#00f"
    if rot % 4 == 0
        for i in [-1..2]
            if i < 2
                addBrick(x+i, y, c)
            else
                addBrick(x+i-1, y-1, "#f00")
    if rot % 4 == 1
        for i in [-1..2]
            if i < 2
                addBrick(x, y+i, c)
            else
                addBrick(x+1, y+i-1, "#f00")
    if rot % 4 == 2
        for i in [-1..2]
            if i < 2
                addBrick(x+i, y, c)
            else
                addBrick(x+i-3, y+1, "#f00")
    if rot % 4 == 3
        for i in [-1..2]
            if i < 2
                addBrick(x, y+i, c)
            else
                addBrick(x-1, y+i-3, "#f00")
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
