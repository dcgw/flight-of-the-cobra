package net.noiseinstitute.flight_of_the_cobra {
    import flash.geom.Point;

    import net.flashpunk.Entity;
    import net.flashpunk.FP;

    public class Shot extends Entity {
        private static const SPEED:Number = 8;

        private var _velocity:Point = new Point();

        public function Shot () {
            active = false;
            graphic = new ShotGraphic(_velocity);
        }

        public function fire (x:Number, y:Number, variance:Number):void {
            this.x = x;
            this.y = y;

            var speed:Number = SPEED + SPEED * (Math.random() - 0.5) * variance;
            var angle:Number = 270 + 90 * (Math.random() - 0.5) * variance;
            FP.angleXY(_velocity, angle, speed);

            active = true;
        }

        public override function update():void {
            x += _velocity.x;
            y += _velocity.y;

            super.update();
        }
    }
}
