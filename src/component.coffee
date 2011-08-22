class Drafty.Component extends Drafty.Object
    constructor: (@entity) ->
        @bind 'change', @changed

    changed: (what, value) =>
        @entity.trigger 'componentChange', @, what, value

Drafty.Component.runAfterAttach = no # set to true if you want to create
                                     # constructor after attaching to entity
