package net.noiseinstitute.flight_of_the_cobra.shooting {
    import net.noiseinstitute.flight_of_the_cobra.IShootingBehaviour;
    import net.noiseinstitute.flight_of_the_cobra.Supplier;
    import net.noiseinstitute.flight_of_the_cobra.Thargoid;
    import net.noiseinstitute.flight_of_the_cobra.ThargoidShot;

    public class FixedShoot implements IShootingBehaviour {
        private var _supplier:Supplier;
        private var _vx:Number;
        private var _vy:Number;
        private var _interval:int;
        private var _intervalOffset:int;

        public function FixedShoot (supplier:Supplier, vx:Number, vy:Number, interval:int, intervalOffset:int=0) {
            _supplier = supplier;
            _vx = vx;
            _vy = vy;
            _interval = interval;
            _intervalOffset = intervalOffset % interval;
        }

        public function update (thargoid:Thargoid, frame:int):void {
            if (frame % _interval == _intervalOffset) {
                var shot:ThargoidShot = _supplier.getThargoidShot();
                shot.shoot(thargoid.x, thargoid.y, _vx, _vy);
            }
        }
    }
}
