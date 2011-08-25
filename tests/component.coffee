module "component",
    setup: ->
        @game = new Drafty.Game 100, 100
        @component = new TestComponent
        @entity = @game.entity [@component]
