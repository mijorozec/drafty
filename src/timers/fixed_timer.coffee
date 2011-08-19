class Drafty.FixedTimer extends Drafty.Timer
    # tps = ticks per second
    constructor: (tickContext, @tps = 100) ->
        super tickContext
    
    start: ->
        @interval = window.setInterval _(@tick).bind(@), 1000 / @tps
    
    stop: ->
        window.clearInterval @interval
