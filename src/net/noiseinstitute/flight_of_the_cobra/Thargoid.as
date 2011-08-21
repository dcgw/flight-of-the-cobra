package net.noiseinstitute.flight_of_the_cobra {
    import net.flashpunk.Entity;
    import net.flashpunk.Mask;
    import net.flashpunk.graphics.Image;
    import net.flashpunk.masks.Hitbox;

    public class Thargoid extends Entity {
        [Embed(source="Thargoid.png")]
        private static const ThargoidSprite:Class;

        private var _behaviour:ThargoidBehaviour;

        public function Thargoid () {
            var image:Image = new Image(ThargoidSprite);
            image.x = -image.width*0.5;
            image.y = -image.height*0.5;

            var mask:Mask = new Hitbox(0, 0, image.width, image.height);

            super(0, 0, image, mask);
        }

        public function set behaviour(behaviour:ThargoidBehaviour):void {
            _behaviour = behaviour;
        }

        override public function update():void {
            if (_behaviour != null) {
                _behaviour.update();
            }
            super.update();
        }
    }
}
