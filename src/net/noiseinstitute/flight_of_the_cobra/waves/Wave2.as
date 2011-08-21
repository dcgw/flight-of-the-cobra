package net.noiseinstitute.flight_of_the_cobra.waves {
    import net.flashpunk.Entity;
    import net.noiseinstitute.flight_of_the_cobra.Main;
    import net.noiseinstitute.flight_of_the_cobra.Supplier;
    import net.noiseinstitute.flight_of_the_cobra.Thargoid;
    import net.noiseinstitute.flight_of_the_cobra.ThargoidBehaviour;

    public class Wave2 extends Entity {
        private static const THARGOID_INTERVAL:int = 16;

        private var _supplier:Supplier;
        private var _thargoidBehaviour:ThargoidBehaviour = new Wave2Behaviour();
        private var _frame:int = 0;

        public function Wave2 (supplier:Supplier) {
            _supplier = supplier;

            super();
        }

        override public function update() :void {
            if (_frame++ % THARGOID_INTERVAL == 0) {
                var thargoid:Thargoid = _supplier.getThargoid();
                thargoid.init(_thargoidBehaviour);
                thargoid.x = Main.WIDTH + thargoid.width;
                thargoid.y = 0.54 * Main.HEIGHT;
            }
        }
    }
}
