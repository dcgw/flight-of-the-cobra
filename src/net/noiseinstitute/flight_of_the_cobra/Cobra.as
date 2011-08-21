package net.noiseinstitute.flight_of_the_cobra {
    import net.flashpunk.Entity;
    import net.flashpunk.Mask;
    import net.flashpunk.graphics.Image;
    import net.flashpunk.masks.Hitbox;
    import net.flashpunk.utils.Input;

    public class Cobra extends Entity{
        [Embed(source="Cobra.png")]
        private static const CobraSprite:Class;

        private static const SPEED:Number = 3;
        private static const FIRE_FRAMES:int = 3;
        private static const SHOTS_PER_FRAME:int = 2;
        private static const SHOT_VARIANCE:Number = 0.1;

        private var _fireRemaining:int = 0;
        private var _shots:Vector.<Shot>;
        private var _nextShotIndex:int = 0;

        public function Cobra (shots:Vector.<Shot>) {
            var image:Image = new Image(CobraSprite);
            image.x = -image.width/2;
            image.y = -image.height/2;

            var mask:Mask = new Hitbox(3, 3, -1, -1);

            super(Main.WIDTH/2, 18, image, mask);
            _shots = shots;
        }

        public override function update():void {
            var movingLeft:Boolean = Input.check("left");
            var movingRight:Boolean = Input.check("right");
            var movingUp:Boolean = Input.check("up");
            var movingDown:Boolean = Input.check("down");

            if (movingLeft && !movingRight) {
                x -= SPEED;
            } else if (movingRight && !movingLeft) {
                x += SPEED;
            }

            if (movingUp && !movingDown) {
                y -= SPEED;
            } else if (movingDown && !movingUp) {
                y += SPEED;
            }

            if (Input.pressed(("fire"))) {
                _fireRemaining = FIRE_FRAMES;
            }

            if (_fireRemaining > 0) {
                for (var i:int=0; i<SHOTS_PER_FRAME; ++i) {
                    fire();
                }
                _fireRemaining--;
            }

            super.update();
        }

        private function fire():void {
            var shot:Shot = _shots[_nextShotIndex];
            shot.fire(x, y, SHOT_VARIANCE);
            _nextShotIndex = (_nextShotIndex + 1) % _shots.length;
        }
    }
}
