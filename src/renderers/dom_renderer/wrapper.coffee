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
        if document.body? then @_appendToBody()
        else
            bind = window.addEventListener ||
                   window.attachEvent
            bind 'load', @_appendToBody, false
    
    _appendToBody: =>
        document.body.appendChild @element
    
    addEntity: (entity) ->
        @entities.push entity
        @element.appendChild entity.element

    removeFromDOM: ->
        if document.body?
            @element.parentElement.removeChild @element
        else
            unbind = window.removeEventListener ||
                     window.detachEvent
            unbind 'load', @_appendToBody, false
        