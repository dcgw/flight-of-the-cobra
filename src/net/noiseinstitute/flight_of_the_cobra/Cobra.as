package net.noiseinstitute.flight_of_the_cobra {
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Image;
    import net.flashpunk.utils.Input;

    public class Cobra extends Entity{
        [Embed(source="Cobra.png")]
        private static const CobraSprite:Class;

        private static const SPEED:Number = 3;
        private static const FIRE_FRAMES:int = 3;
        private static const SHOTS_PER_FRAME:int = 2;
        private static const SHOT_VARIANCE:Number = 0.2;

        private var _fireRemaining:int = 0;
        private var _shots:Vector.<Shot>;
        private var _nextShotIndex:int = 0;

        public function Cobra (shots:Vector.<Shot>) {
            super(Main.WIDTH/2, 6, new Image(CobraSprite));
            _shots = shots;
        }

        public override function update():void {
            var movingLeft:Boolean = Input.check("left");
            var movingRight:Boolean = Input.check("right");

            if (movingLeft && !movingRight) {
                x -= SPEED;
            } else if (movingRight && !movingLeft) {
                x += SPEED;
            }

            if (Input.check("fire")) {
                _fireRemaining = FIRE_FRAMES;
            }

            if (_fireRemaining > 0) {
                for (var i:int=0; i<SHOTS_PER_FRAME; ++i) {
                    fire();
                }
                _fireRemaining;
            }

            super.update();
        }

        private function fire():void {
            var shot:Shot = _shots[_nextShotIndex];
            shot.fire(x, y);
            _nextShotIndex = (_nextShotIndex + 1) % _shots.length;
        }
    }
}
