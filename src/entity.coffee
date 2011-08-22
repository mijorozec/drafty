class Drafty.Entity extends Drafty.Object
    constructor: ->
        @components = []
        @id = @createUID()
        @resetChanged()

        @bind 'componentChange', _(@componentChange).bind @

    addComponent: (component) ->
        if _.isString(component) and Drafty[component]
            name = component
            component = Drafty[component]

        unless _.isFunction(component)
            throw new Error "#{component} is not instantiable"
        unless component.name or name
            throw new Error "Cannot get name of component. Try adding .name property"
        
        name = _.lowerCaseFirst(name or component.name) # convert name, so it can be attached as property
        @components.push name
        @createFakeConstructor component, name
        @[name]() if component.runAfterAttach

        @[name]
    
    # create fake constructor for component. for example, user calls entity.comp(123)
    createFakeConstructor: (component, name) ->
        @[name] = ->
            obj = new component(@, arguments...) # give the arguments to real constructor
            @[name] = obj # rewrite this function to newly created object
            obj # user can now call entity.comp.doSomething(123)
    
    has: (name) ->
        name in @components
    
    createUID: ->
        _.uniqueId 'entity_'
    
    componentChange: (component, what, value) ->
        @changed.push
            component: component
            what: what
            value: value
    
    hasChanged: ->
        @changed.length > 0
    
    resetChanged: ->
        @changed = []

