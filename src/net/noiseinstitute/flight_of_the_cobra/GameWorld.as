package net.noiseinstitute.flight_of_the_cobra {
    import net.flashpunk.Entity;
    import net.flashpunk.World;

    public class GameWorld extends World {
        private static const NUM_SHOTS:int = 128;

        public function GameWorld () {
            var background:Entity = new Entity();
            background.graphic = new BackgroundGraphic();
            add(background);

            var shots:Vector.<Shot> = new Vector.<Shot>();
            for (var i:int=0; i<NUM_SHOTS; ++i) {
                shots[i] = new Shot();
                add(shots[i]);
            }

            add(new Cobra(shots));
        }
    }
}
