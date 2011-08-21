package net.noiseinstitute.flight_of_the_cobra {
    public class Supplier {
        private static const NUM_THARGOIDS:int = 64;
        private static const NUM_THARGOID_SHOTS:int = 128;

        private var _thargoids:Vector.<Thargoid> = new Vector.<Thargoid>();
        private var _thargoidShots:Vector.<ThargoidShot> = new Vector.<ThargoidShot>();

        private var _nextThargoid:int = 0;
        private var _nextThargoidShot:int = 0;

        public function Supplier (world:GameWorld) {
            var i:int;
            for (i=0; i<NUM_THARGOIDS; ++i) {
                _thargoids[i] = new Thargoid();
                world.add(_thargoids[i]);
            }

            for (i=0; i<NUM_THARGOID_SHOTS; ++i) {
                _thargoidShots[i] = new ThargoidShot();
                world.add(_thargoidShots[i]);
            }
        }

        public function getThargoid():Thargoid {
            var thargoid:Thargoid = _thargoids[_nextThargoid];
            _nextThargoid = (_nextThargoid + 1) % _thargoids.length;
            return thargoid;
        }

        public function getThargoidShot():ThargoidShot {
            var shot:ThargoidShot = _thargoidShots[_nextThargoidShot];
            _nextThargoidShot = (_nextThargoidShot + 1) % _thargoidShots.length;
            return shot;
        }
    }
}
