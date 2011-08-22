_.mixin
    lowerCaseFirst: (str) ->
        str.charAt(0).toLowerCase() + str.substr(1)

    addEventListener: (object, event, fn) ->
        if window.addEventListener
            object.addEventListener event, fn, false
        else if window.attachEvent
            object.attachEvent event, fn
    
    remove: (array, value) ->
        index = _(array).indexOf value
        array.splice index, 1 if index > -1
