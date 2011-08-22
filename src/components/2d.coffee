class Drafty["2D"] extends Drafty.Component    
    moveTo: (@x, @y) ->
    moveBy: (x, y) ->
        @x += x
        @y += y
        
    resizeTo: (@w, @h) ->
    resizeBy: (w, h) ->
        @w += w
        @h += h
    
    @property 'x', default: 0
    @property 'y', default: 0
    @property 'w', default: 0
    @property 'h', default: 0

Drafty["2D"].runAfterAttach = yes
