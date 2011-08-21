package net.noiseinstitute.flight_of_the_cobra.movement {
    import net.noiseinstitute.flight_of_the_cobra.IMovementBehaviour;
    import net.noiseinstitute.flight_of_the_cobra.Thargoid;

    public class StraightLineMovement implements IMovementBehaviour {
        private var _vx:Number;
        private var _vy:Number;

        public function StraightLineMovement (vx:Number, vy:Number) {
            _vx = vx;
            _vy = vy;
        }

        public function update (thargoid:Thargoid, frame:int):void {
            thargoid.x += _vx;
            thargoid.y += _vy;
        }
    }
}
