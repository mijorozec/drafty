class Drafty.DomRenderer extends Drafty.Renderer
    constructor: (@game, @timer) ->
        @createWrapper()

        @timer ||= new Drafty.AnimationTimer
        @timer.start()

        @entities = {}
        @nodes = {}

        @bind()

    createWrapper: ->
        body = document.body
        wrapper = @createDiv()
        _(wrapper.style).extend
            width: "#{@game.width}px"
            height: "#{@game.height}px"
            overflow: 'hidden'
            position: 'relative'
        
        if body
            body.appendChild wrapper
        else
            bind = window.addEventListener ||
                   window.attachEvent
            bind 'load', ->
                document.body.appendChild wrapper
            , false

        @wrapper = wrapper
    
    bind: ->
        @timer.bind 'tick', _(@draw).bind @
        @game.bind 'createEntity', _(@create).bind @
        @game.bind 'removeEntity', _(@remove).bind @
    
    draw: ->
        _(@entities).each (entity) ->
            @update entity if entity.changed.length
        , @
    
    update: (entity) ->
        # node = @entities[entity.id]
        console.info "Updating entity #{entity.id}:"
        console.dir entity
        entity.resetChanged()
        
    create: (entity) ->
        div = @createDiv entity.id
        _(div.style).extend
            position: 'absolute'
            left: entity.twoD.x + "px"
            top: entity.twoD.y + "px"
            width: entity.twoD.w + "px"
            height: entity.twoD.h + "px"
            backgroundColor: '#000'

        @entities[entity.id] = entity
        @nodes[entity.id] = div
        @appendDiv div

    remove: (entity) ->
        console.info "Removing entity #{entity.id}"
    
    createDiv: (id) ->
        div = document.createElement 'div'
        div.id = id if id
        div
    
    appendDiv: (div) ->
        @wrapper.appendChild div
