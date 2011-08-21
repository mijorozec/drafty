class Drafty.Background extends Drafty.Component
    constructor: (entity, color) ->
        super entity
        @color = color
    
    @property 'color'
