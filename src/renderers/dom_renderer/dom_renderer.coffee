class Drafty.DomRenderer extends Drafty.Renderer
    constructor: (@game, @timer) ->
        @wrapper = new Drafty.DomRenderer.Wrapper @, @game.width, @game.height

        @timer ||= new Drafty.AnimationTimer
        @timer.start()

        @entities = {}
        @nodes = {}

        @bind()
    
    bind: ->
        @timer.bind 'tick', @render
        @game.bind 'createEntity', @create
        @game.bind 'removeEntity', @remove
    
    render: =>
        _(@entities).each (entity) =>
            @update entity if entity.hasChanged()
    
    update: (entity) ->
        console.info "Updating entity #{entity.id}"

        @nodes[entity.id].update()
        entity.resetChanged()
        
    create: (entity) =>
        console.info "Creating entity #{entity.id}"

        node = new Drafty.DomRenderer.Entity entity

        @entities[entity.id] = entity
        @nodes[entity.id] = node

        @wrapper.addEntity node

    remove: (entity) =>
        console.info "Removing entity #{entity.id}"
