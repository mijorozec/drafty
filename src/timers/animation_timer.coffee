class Drafty.AnimationTimer extends Drafty.Timer    
    start: ->
        @running = yes
        
        onFrame = @onFrame # can't run this.onFrame...

        step = _( ->
            return unless @running

            @tick()
            onFrame step
        ).bind @

        step()
    
    stop: ->
        @running = no
    
    onFrame:
        window.requestAnimationFrame       ||
        window.webkitRequestAnimationFrame ||
        window.mozRequestAnimationFrame    ||
        window.oRequestAnimationFrame      ||
        window.msRequestAnimationFrame     ||
        (callback, element) ->
            window.setTimeout(callback, 1000 / 60);
