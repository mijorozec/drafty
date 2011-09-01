class TestComponent extends Drafty.Component
    constructor: (entity, arg) ->
        super entity
        equal arg, 'foo', "constructor called with argument"
    
    @property 'test'

module "entity",
    setup: ->
        @game = new Drafty.Game 100, 100
        @entity = @game.entity [ TestComponent ];

test "intializing", ->
    entity = @game.entity []
    equal entity.components.length, 0, "no components"
    ok entity.id.substr(0, 7) is 'entity_', "id starts with entity_"
    equal entity.changed.length, 0, "nothing changed"

test "initializing component", ->
    expect 3
        
    ok _(@entity.testComponent).isFunction(), "is constructor"
    @entity.testComponent 'foo'
    ok _(@entity.testComponent).isObject(), "is instance"

test "has", ->
    ok @entity.has 'testComponent', 'has real component'
    ok not @entity.has 'foo', 'has not fake component'

test "changes", ->
    expect 3
    
    @entity.testComponent 'foo'
    @entity.testComponent.test = 'foo'

    until @entity.hasChanged()
        do ->

    change = @entity.changed[0]
    equal change.what, 'test', 'notice changed property name'
    equal change.value, 'foo', 'notice changed property value'
