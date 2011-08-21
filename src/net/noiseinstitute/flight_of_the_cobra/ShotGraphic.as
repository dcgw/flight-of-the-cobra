package net.noiseinstitute.flight_of_the_cobra {
    import flash.display.BitmapData;
    import flash.display.Graphics;
    import flash.display.MovieClip;
    import flash.geom.Point;

    import net.flashpunk.Graphic;

    public class ShotGraphic extends Graphic {
        private var _velocity:Point;
        private var _canvas:MovieClip = new MovieClip();

        public function ShotGraphic (velocity:Point) {
            _velocity = velocity;
        }

        public override function render(target:BitmapData, point:Point, camera:Point):void {
            var graphics:Graphics = _canvas.graphics;
            graphics.clear();
            graphics.lineStyle(1, 0xffffff);
            graphics.moveTo(point.x, point.y);
            graphics.lineTo(point.x + _velocity.x*3, point.y + _velocity.y*3);

            target.draw(_canvas);
        }
    }
}
