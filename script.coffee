
ctx = $('#game')[0].getContext('2d')

drawBrick = (x, y) ->
    ctx.fillRect((x-1)*40+2, (y-1)*40+2, 38, 38)
