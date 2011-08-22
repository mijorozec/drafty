class Drafty.DomRenderer.Wrapper extends Drafty.Object
    constructor: (@renderer, @width, @height) ->
        @element = document.createElement 'div'
        @element.id = 'drafty'
        @setStyles()
        @appendToDOM()

        @entities = []
    
    setStyles: ->
        _(@element.style).extend
            width: @width + "px"
            height: @height + "px"
            overflow: 'hidden'
            position: 'relative'
    
    appendToDOM: ->
        append = ->
            document.body.appendChild @element

        if document.body? then append()
        else
            bind = window.addEventListener ||
                   window.attachEvent
            bind 'load', _(append).bind(@), false
    
    addEntity: (entity) ->
        @entities.push entity
        @element.appendChild entity.element
        