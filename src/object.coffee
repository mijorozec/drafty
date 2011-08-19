class Drafty.Object
    bind: (event, fn) ->
        @events ||= {}
        @events[event] ||= []
        @events[event].push(fn)
    
    trigger: (event, args...) ->
        @events ||= {}
        if @events[event]
            e(args...) for e in @events[event]
            true
        else false
# helper for properties
# use: (in class declaration)
#     @property 'p', default: 1, access: Derafty.WRITE
Drafty.Object.property = (name, options) ->
    options ?= {}
    options.access ?= Drafty.READ | Drafty.WRITE
    options.default ?= null
    options.enumerate ?= yes
    options.trigger ?= yes

    config =
        writeable: options.access & Drafty.WRITE
        configurable: no
        enumerable: options.enumerate

    if options.access & Drafty.READ then config.get = -> @['_' + name] ?= options.default
    if options.access & Drafty.WRITE then config.set = (value) ->
        @['_' + name] = value
        @trigger 'change', name if options.trigger
    
    Object.defineProperty @prototype, name, config
