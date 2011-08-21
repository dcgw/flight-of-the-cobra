package net.noiseinstitute.flight_of_the_cobra {
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Image;

    public class Thargoid extends Entity {
        [Embed(source="Thargoid.png")]
        private static const ThargoidSprite:Class;

        public function Thargoid () {
            var image:Image = new Image(ThargoidSprite);
            image.x = -image.width*0.5;
            image.y = -image.height*0.5;

            super(0, 0, image);
        }
    }
}
