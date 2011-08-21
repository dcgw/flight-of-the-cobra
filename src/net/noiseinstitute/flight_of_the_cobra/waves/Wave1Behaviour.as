package net.noiseinstitute.flight_of_the_cobra.waves {
    import net.noiseinstitute.flight_of_the_cobra.Main;
    import net.noiseinstitute.flight_of_the_cobra.Supplier;
    import net.noiseinstitute.flight_of_the_cobra.Thargoid;
    import net.noiseinstitute.flight_of_the_cobra.ThargoidBehaviour;
    import net.noiseinstitute.flight_of_the_cobra.ThargoidShot;

    public class Wave1Behaviour extends ThargoidBehaviour {
        private static const VX:Number = 2;
        private static const VY:Number = -0.25;
        private static const SHOT_INTERVAL:int = 15;
        private static const SHOT_VX:Number = 0;
        private static const SHOT_VY:Number = -1;

        private var _supplier:Supplier;

        public function Wave1Behaviour(supplier:Supplier) {
            _supplier = supplier;
        }

        public override function update (thargoid:Thargoid, frame:int):void {
            thargoid.x += VX;
            thargoid.y += VY;

            if (thargoid.x > Main.WIDTH + thargoid.width) {
                thargoid.dispose();
            }

            if (frame % SHOT_INTERVAL == 0) {
                var shot:ThargoidShot = _supplier.getThargoidShot();
                shot.shoot(thargoid.x, thargoid.y, SHOT_VX, SHOT_VY);
            }
        }
    }
}
