class Drafty.DomRenderer.Entity extends Drafty.Object
    constructor: (@entity) ->
        @element = document.createElement 'div'
        @element.id = entity.id

        @set 'position', 'absolute'
    
    update: ->
        _(@entity.changed).each (change) ->
            if change.component instanceof Drafty.TwoD
                name = switch change.what
                           when 'x' then 'top'
                           when 'y' then 'left'
                           when 'w' then 'width'
                           when 'h' then 'height'
            if change.component instanceof Drafty.Background
                name = 'backgroundColor'
                
            @set name, change.value if name
        , @
    
    set: (name, value) ->
        if name in ['width', 'height', 'top', 'left']
            @element.style[name] = value + "px"
        else
            @element.style[name] = value
