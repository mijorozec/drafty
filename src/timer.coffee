class Drafty.Timer extends Drafty.Object
    construct: (@tickContext) ->
    
    start: ->
        throw new Error "Oh! I can't start, I'm not designed for that!"
    
    pause: ->
        @stop()
    
    stop: ->
        throw new Error "I don't remember that I even started. How can I stop then?"

    tick: ->
        @trigger 'tick'
