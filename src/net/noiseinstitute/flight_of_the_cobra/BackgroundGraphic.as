package net.noiseinstitute.flight_of_the_cobra {
    import flash.display.BitmapData;
    import flash.geom.Point;

    import net.flashpunk.Graphic;

    public class BackgroundGraphic extends Graphic {
        private static const NUM_STARS:int = 64;
        private static const SPEED:Number = 4;

        private var _frame:int=0;
        private var _randomness:Vector.<Number> = new Vector.<Number>();

        public function BackgroundGraphic() {
            active = true;

            for (var i:int=0; i<NUM_STARS*3; ++i) {
                _randomness[i] = Math.random();
            }
        }

        public override function update():void {
            _frame++;
            super.update();
        }

        public override function render(target:BitmapData, point:Point, camera:Point):void {
            target.lock();
            for (var i:int=0; i<NUM_STARS; ++i) {
                var x:int = _randomness[i*3] * Main.WIDTH;
                var y:int = _randomness[i*3 + 1] * Main.HEIGHT;
                var distance:Number = _randomness[i*3 + 2];
                y = (y + (1-distance) * SPEED * _frame) % Main.HEIGHT;
                var color:uint = (1-distance) * 0xff;
                color = color | color << 8 | color << 16;

                target.setPixel(x, y, color);
            }
            target.unlock();
        }
    }
}
