class Drafty.Keyboard extends Drafty.Object
    constructor: ->
        _(window).addEventListener 'keydown', _(@keyDown).bind @
        _(window).addEventListener 'keyup', _(@keyUp).bind @

        @pressed = []
    
    keyDown: (e) ->
        code = e.keyCode
        @pressed.push code unless _(@pressed).include code
        @trigger 'keyDown', e
        
    keyUp: (e) ->
        code = e.keyCode
        _(@pressed).remove code
        @trigger 'keyUp', e
        
