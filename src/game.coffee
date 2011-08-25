class Drafty.Game extends Drafty.Object
    constructor: (@width, @height, @timer) ->
        @timer ||= new Drafty.FixedTimer
        @timer.start()

        @keyboard = new Drafty.Keyboard

        @entities = []
    
    renderOn: (name) ->
        @renderer = do =>
            if name instanceof Drafty.Renderer
                return name
            if _(name).isString()
                switch name
                    when "dom" then return new Drafty.DomRenderer @
            if _(name).isFunction()
                renderer = new name @
                if renderer instanceof Drafty.Renderer
                    return renderer
            
            throw new Error "#{name} is not valid renderer"
    
    entity: (components) ->
        entity = new Drafty.Entity

        _(components).each (component) ->
            entity.addComponent component
        
        @entities.push entity
        @trigger 'createEntity', entity
        
        entity

                