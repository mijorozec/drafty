module "timer",
    setup: ->
        @timer = new Drafty.Timer

test "start", ->
    raises ->
        @timer.start()
    , "Oh! I can't start, I'm not designed for that!", "starting raises error"

test "pause", ->
    raises ->
        @timer.pause()
    , "I don't remember that I even started. How can I stop then?", "pausing raises error"

test "stop", ->
    raises ->
        @timer.stop()
    , "I don't remember that I even started. How can I stop then?", "stopping raises error"


ticking = ->
    expect 3

    i = 0
    @timer.bind 'tick', =>
        i++

        ok true, "tick no. #{i}"

        if i is 3
            @timer.stop()
            start()
    
    stop()
    @timer.start()



module "animation_timer",
    setup: ->
        @timer = new Drafty.AnimationTimer

test "start", ->
    @timer.start()
    ok @timer.running, "timer is running"

test "ticking & stop", ticking



module "fixed_timer",
    setup: ->
        @timer = new Drafty.AnimationTimer

test "start", ->
    @timer.start()

test "ticking & stop", ticking
