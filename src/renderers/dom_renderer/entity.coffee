class Drafty.DomRenderer.Entity extends Drafty.Object
    constructor: (@entity) ->
        @element = document.createElement 'div'
        @element.id = entity.id

        @setupStyles()
    
    setupStyles: ->
        _(@element.style).extend
            position: 'absolute'
    
    update: ->
        console.log @entity.changed