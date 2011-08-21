package net.noiseinstitute.flight_of_the_cobra.waves {
    import net.noiseinstitute.flight_of_the_cobra.Thargoid;
    import net.noiseinstitute.flight_of_the_cobra.ThargoidBehaviour;

    public class Wave1Behaviour extends ThargoidBehaviour {
        private var _vx:Number = 2;
        private var _vy:Number = -0.25;

        public override function update (thargoid:Thargoid):void {
            thargoid.x += _vx;
            thargoid.y += _vy;
        }
    }
}
