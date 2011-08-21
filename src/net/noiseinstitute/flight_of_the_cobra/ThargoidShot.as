package net.noiseinstitute.flight_of_the_cobra {
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Image;

    public class ThargoidShot extends Entity {
        [Embed(source="ThargoidShot.png")]
        private static const ThargoidShotSprite:Class;

        private var _vx:Number;
        private var _vy:Number;

        public function ThargoidShot() {
            var image:Image = new Image(ThargoidShotSprite);
            image.x = -image.width*0.5;
            image.y = -image.height*0.5;
            super(0, 0, image);

            active = false;
            collidable = false;
            visible = false;

            setHitboxTo(graphic);
            type = null;
        }

        public function shoot(x:Number, y:Number, vx:Number, vy:Number):void {
            active = true;
            collidable = true;
            visible = true;
            type = "enemy-shot";
            this.x = x;
            this.y = y;
            _vx = vx;
            _vy = vy;
        }

        public override function update():void {
            x += _vx;
            y += _vy;
            super.update();
        }

        public function dispose():void {
            active = false;
            collidable = false;
            visible = false;
            type = null;
        }
    }
}
