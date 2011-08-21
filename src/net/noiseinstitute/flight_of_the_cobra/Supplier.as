package net.noiseinstitute.flight_of_the_cobra {
    public class Supplier {
        private static const NUM_THARGOIDS:int = 128;
        private static const NUM_THARGOID_SHOTS:int = 1024;

        private var _thargoids:Vector.<Thargoid> = new Vector.<Thargoid>();

        private var _nextThargoid:int = 0;

        public function Supplier (world:GameWorld) {
            for (var i:int=0; i<NUM_THARGOIDS; ++i) {
                _thargoids[i] = new Thargoid();
                world.add(_thargoids[i]);
            }
        }

        public function getThargoid():Thargoid {
            var thargoid:Thargoid = _thargoids[_nextThargoid];
            _nextThargoid = (_nextThargoid + 1) % _thargoids.length;
            return thargoid;
        }
    }
}
