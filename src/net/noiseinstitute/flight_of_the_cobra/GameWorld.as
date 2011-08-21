package net.noiseinstitute.flight_of_the_cobra {
    import net.flashpunk.Entity;
    import net.flashpunk.World;
    import net.noiseinstitute.flight_of_the_cobra.waves.Wave1;
    import net.noiseinstitute.flight_of_the_cobra.waves.Wave2;

    public class GameWorld extends World {
        private static const NUM_SHOTS:int = 32;

        private var _shots:Vector.<Shot> = new Vector.<Shot>();

        public function GameWorld () {
            var background:Entity = new Entity();
            background.graphic = new BackgroundGraphic();
            add(background);

            for (var i:int=0; i<NUM_SHOTS; ++i) {
                _shots[i] = new Shot();
                add(_shots[i]);
            }

            var supplier:Supplier = new Supplier(this);
            add(new Wave1(supplier));
            add(new Wave2(supplier));

            add(new Cobra(_shots));

            //active = true;
        }

        public override function update():void {
            super.update();

            for each (var shot:Shot in _shots) {
                if (shot.active) {
                    var enemy:Entity;
                    if ((enemy = collideLine("enemy", shot.x, shot.y, shot.endX, shot.endY)) != null) {
                        Thargoid(enemy).kill();
                    }
                }
            }
        }
    }
}
