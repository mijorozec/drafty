module "utils"

test "lowerCaseFirst", ->
    str = 'FooBar'
    equal 'fooBar', _(str).lowerCaseFirst(), "from upper to lower"

    str = 'fooBar'
    equal 'fooBar', _(str).lowerCaseFirst(), "from lower to lower"

    str = ''
    equal '', _(str).lowerCaseFirst(), "empty string is empty"

    str = '123'
    equal '123', _(str).lowerCaseFirst(), "numbers"

test "remove", ->
    array = ['this', 'is', 'a', 'test', 'cat']
    _(array).remove 'test'
    deepEqual ['this', 'is', 'a', 'cat'], array, "removing element"

    array = [1, 2, 3]
    _(array).remove 42
    deepEqual [1, 2, 3], array, "not removing element"

test "addEventListener", ->
    ok false, "don't know how to test this..."
