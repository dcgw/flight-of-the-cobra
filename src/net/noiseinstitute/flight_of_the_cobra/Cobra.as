package net.noiseinstitute.flight_of_the_cobra {
    import flash.net.sendToURL;

    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Image;
    import net.flashpunk.utils.Input;

    public class Cobra extends Entity{
        [Embed(source="Cobra.png")]
        private static const CobraSprite:Class;

        private static const SPEED:Number = 3;

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

            super.update();
        }
    }
}
