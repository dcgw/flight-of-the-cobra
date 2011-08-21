package net.noiseinstitute.flight_of_the_cobra {
    import net.flashpunk.Entity;
    import net.flashpunk.World;
    import net.noiseinstitute.flight_of_the_cobra.waves.Wave1;

    public class GameWorld extends World {
        private static const NUM_SHOTS:int = 32;

        private var _shots:Vector.<Shot> = new Vector.<Shot>();
        private var _frame:int = 0;

        private var _waves:Vector.<Entity> = new Vector.<Entity>();

        public function GameWorld () {
            var background:Entity = new Entity();
            background.graphic = new BackgroundGraphic();
            add(background);

            var i:int;
            for (i; i<NUM_SHOTS; ++i) {
                _shots[i] = new Shot();
                add(_shots[i]);
            }

            var supplier:Supplier = new Supplier(this);

            _waves[0] = new Wave1(supplier);

            for (i=0; i<_waves.length; ++i) {
                _waves[i].active = false;
                add(_waves[i]);
            }

            add(new Cobra(_shots));
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

            if (_frame == 15) {
                _waves[0].active = true;
            } else if (_frame == 135) {
                _waves[0].active = false;
            }

            ++_frame;
        }
    }
}
