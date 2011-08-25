module "game",
    setup: ->
        @game = new Drafty.Game 100, 100

test "initialization", ->
    ok @game.timer, "has timer"
    ok @game.timer instanceof Drafty.Timer, "timer is timer"
    ok @game.keyboard, "has keyboard"
    equal @game.entities.length, 0, "no entities"

test "rendering with dom", ->
    @game.renderOn "dom"
    ok @game.renderer instanceof Drafty.DomRenderer

class DummyRenderer extends Drafty.Renderer

test "rendering with own renderer", ->
    renderer = new DummyRenderer
    @game.renderOn renderer
    equal @game.renderer, renderer

test "adding entity", ->
    ok @game.entity []



