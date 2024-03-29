package net.noiseinstitute.flight_of_the_cobra {
    import net.flashpunk.Entity;
    import net.flashpunk.World;
    import net.noiseinstitute.flight_of_the_cobra.movement.StraightLineMovement;
    import net.noiseinstitute.flight_of_the_cobra.shooting.FixedShoot;

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

            _waves[0] = new Wave(supplier, 16,
                    -16, 200,
                    new StraightLineMovement(2, -0.3),
                    new FixedShoot(supplier, 0.1, -1, 30));
            _waves[1] = new Wave(supplier, 16,
                    176, 135,
                    new StraightLineMovement(-2, 0.3),
                    new FixedShoot(supplier, -0.1, -1, 30));
            _waves[2] = new Wave(supplier, 14,
                    -16, 0,
                    new StraightLineMovement(1, 3),
                    new FixedShoot(supplier, 1, -1, 15));
            _waves[3] = new Wave(supplier, 14,
                    176, 20,
                    new StraightLineMovement(-1.2, 3),
                    new FixedShoot(supplier, -1, -1, 15));
            _waves[4] = new Wave(supplier, 18,
                    -16, 220,
                    new StraightLineMovement(1.4, 0),
                    new FixedShoot(supplier, 0.1, -0.5, 40));
            _waves[5] = new Wave(supplier, 18,
                    176, 190,
                    new StraightLineMovement(-1.4, 0),
                    new FixedShoot(supplier, -0.1, -0.5, 40));
            _waves[6] = new Wave(supplier, 12,
                    -16, 160,
                    new StraightLineMovement(2.4, 0),
                    new FixedShoot(supplier, 0.1, -1, 30));
            _waves[7] = new Wave(supplier, 12,
                    176, 130,
                    new StraightLineMovement(-2.4, 0),
                    new FixedShoot(supplier, -0.1, -1, 30));


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
            } else if (_frame == 75) {
                _waves[1].active = true;
            } else if (_frame == 255) {
                _waves[0].active = false;
            } else if (_frame == 345) {
                _waves[2].active = true;
            } else if (_frame == 375) {
                _waves[1].active = false;
            } else if (_frame == 395) {
                _waves[3].active = true
            } else if (_frame == 405) {
                _waves[2].active = false;
            } else if (_frame == 455) {
                _waves[3].active = false;
            } else if (_frame == 475) {
                _waves[4].active = true;
            } else if (_frame == 505) {
                _waves[5].active = true;
            } else if (_frame == 625) {
                _waves[6].active = true;
            } else if (_frame == 655) {
                _waves[7].active = true;
            } else if (_frame == 685) {
                _waves[7].active = false;
            } else if (_frame == 715) {
                _waves[6].active = false;
            } else if (_frame == 835) {
                _waves[5].active = false;
            } else if (_frame == 865) {
                _waves[4].active = false;
            } else if (_frame == 894) {
                _frame = -1;
            }

            ++_frame;
        }
    }
}
