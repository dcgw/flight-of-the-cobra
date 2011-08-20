package net.noiseinstitute.flight_of_the_cobra {
    import flash.net.sendToURL;

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

        public function Cobra () {
            super(Main.WIDTH/2, 6, new Image(CobraSprite));
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

        }
    }
}
