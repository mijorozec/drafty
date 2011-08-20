class Drafty.DomRenderer extends Drafty.Renderer
    constructor: (@game, @timer) ->
        @wrapper = new Drafty.DomRenderer.Wrapper @, @game.width, @game.height

        @timer ||= new Drafty.AnimationTimer
        @timer.start()

        @entities = {}
        @nodes = {}

        @bind()
    
    bind: ->
        @timer.bind 'tick', _(@render).bind @
        @game.bind 'createEntity', _(@create).bind @
        @game.bind 'removeEntity', _(@remove).bind @
    
    render: ->
        _(@entities).each (entity) ->
            @update entity if entity.changed.length
        , @
    
    update: (entity) ->
        # node = @entities[entity.id]
        console.info "Updating entity #{entity.id}:"
        console.dir entity
        entity.resetChanged()
        
    create: (entity) ->
        div = document.createElement 'div'
        div.id = entity.id
        _(div.style).extend
            position: 'absolute'
            left: entity.twoD.x + "px"
            top: entity.twoD.y + "px"
            width: entity.twoD.w + "px"
            height: entity.twoD.h + "px"
            backgroundColor: '#000'

        @entities[entity.id] = entity
        @nodes[entity.id] = div

        @wrapper.addEntity div

    remove: (entity) ->
        console.info "Removing entity #{entity.id}"
