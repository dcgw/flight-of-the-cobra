package net.noiseinstitute.flight_of_the_cobra {
    import net.flashpunk.Engine;
    import net.flashpunk.FP;
    import net.flashpunk.utils.Input;
    import net.flashpunk.utils.Key;

    [SWF(width="320", height="480", backgroundColor="#000000", frameRate="60")]
    public class Main extends Engine {
        public static const WIDTH:int = 160;
        public static const HEIGHT:int = 240;
        public static const FPS:int = 60;

        public function Main () {
            super(WIDTH, HEIGHT, FPS, true);

            Input.define("left", Key.LEFT);
            Input.define("right", Key.RIGHT);
            Input.define("up", Key.UP);
            Input.define("down", Key.DOWN);
            Input.define("fire", Key.Z, Key.X, Key.CONTROL);
            Input.define("beam", Key.C, Key.SPACE, Key.SHIFT);

            FP.screen.scale = 2;

            FP.world = new GameWorld();
        }
    }
}
