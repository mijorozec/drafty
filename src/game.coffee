class Drafty.Game extends Drafty.Object
    constructor: (@width, @height, @timer) ->
        @timer ||= new Drafty.FixedTimer
        @timer.start()

        @keyboard = new Drafty.Keyboard

        @entities = []
    
    renderOn: (name) ->
        renderer = if name instanceof Drafty.Renderer
                       name
                   else switch name
                       when "dom" then Drafty.DomRenderer
                     # when "canvas" then Drafty.CanvasRenderer
                       else throw new Error "Sorry, I can't render on \"#{name}\"."
        
        @renderer = new renderer @
    
    entity: (components) ->
        entity = new Drafty.Entity

        _(components).each (component) ->
            entity.addComponent component
        
        @entities.push entity
        @trigger 'createEntity', entity
        
        entity

                