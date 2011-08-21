package net.noiseinstitute.flight_of_the_cobra {
    import net.flashpunk.Entity;

    public class Wave extends Entity {
        private static const THARGOID_INTERVAL:int = 60;

        private var _supplier:Supplier;
        private var _frame:int = 0;

        public function Wave (supplier:Supplier) {
            _supplier = supplier;

            super();
        }

        override public function update() :void {
            if (_frame++ % THARGOID_INTERVAL == 0) {
                var thargoid:Thargoid = _supplier.getThargoid();
                thargoid.init();
                thargoid.x = Main.WIDTH/2;
                thargoid.y = Main.HEIGHT/2;
            }
        }
    }
}
