class Drafty.FixedTimer extends Drafty.Timer
    # tps = ticks per second
    constructor: (@tps = 100) ->
        super

    start: ->
        @interval = window.setInterval @tick, 1000 / @tps
    
    stop: ->
        window.clearInterval @interval
