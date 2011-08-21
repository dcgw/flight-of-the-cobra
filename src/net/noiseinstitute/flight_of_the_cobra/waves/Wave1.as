package net.noiseinstitute.flight_of_the_cobra.waves {
    import net.flashpunk.Entity;
    import net.noiseinstitute.flight_of_the_cobra.*;
    import net.noiseinstitute.flight_of_the_cobra.movement.StraightLineMovement;
    import net.noiseinstitute.flight_of_the_cobra.shooting.FixedShoot;

    public class Wave1 extends Entity {
        private static const THARGOID_INTERVAL:int = 16;

        private var _supplier:Supplier;
        private var _movementBehaviour:IMovementBehaviour;
        private var _frame:int = 0;
        private var _shootingBehaviour:IShootingBehaviour;

        public function Wave1 (supplier:Supplier) {
            _supplier = supplier;
            _movementBehaviour = new StraightLineMovement(2, -0.25);
            _shootingBehaviour = new FixedShoot(supplier, 0, -1, 15);

            super();
        }

        override public function update() :void {
            if (_frame++ % THARGOID_INTERVAL == 0) {
                var thargoid:Thargoid = _supplier.getThargoid();
                thargoid.init(_movementBehaviour, _shootingBehaviour);
                thargoid.x = -thargoid.width;
                thargoid.y = 0.8 * Main.HEIGHT;
            }
        }
    }
}
