class Drafty.Component extends Drafty.Object
    constructor: (@entity) ->
        @bind 'change', _(@changed).bind @

    changed: (what) ->
        @entity.changed.push what

Drafty.Component.runAfterAttach = no # set to true if you want to create
                                     # constructor after attaching to entity
