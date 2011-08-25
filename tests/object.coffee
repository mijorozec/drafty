module "object"

class PropertiesTest extends Drafty.Object
    @property 'readOnly', access: Drafty.READ, default: 'foo'
    @property 'writeOnly', access: Drafty.WRITE
    @property 'readWrite'
    @property 'notEnumerable', enumerate: false

o = new PropertiesTest
window.o = o

test "read only property", ->
    equal o.readOnly, 'foo', "reading from default"
    raises ->
        o.readOnly = 'bar'
    , TypeError, "property can't change"

test "write only property", ->
    equal o.writeOnly, undefined, "property is undefined"
    o.writeOnly = 'foo'
    equal o.writeOnly, undefined, "property is still undefined"

test "read & write property", ->
    equal o.readWrite, null, "property is null"
    o.readWrite = 'foo'
    equal o.readWrite, 'foo', "property has value"

test "enumerating property", ->
    expect 1

    for key, value of o
        ok true, "is enumerable" if key is 'readWrite'

test "not enumerating property", ->
    expect 0

    for key, value of o
        ok false, "is enumerable" if key is 'notEnumerable'

test "events", ->
    expect 3

    e = new Drafty.Object

    e.bind 'test', ->
        ok true, "triggering without arguments"
    e.bind 'test', ->
        ok true, "multiple bindings"
    
    e.trigger 'test'

    e.bind 'testWithArgs', (arg) ->
        equal arg, 'foo', "triggering with arguments"
    
    e.trigger 'testWithArgs', 'foo'


