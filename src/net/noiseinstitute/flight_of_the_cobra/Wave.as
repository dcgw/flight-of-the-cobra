package net.noiseinstitute.flight_of_the_cobra {
    import net.flashpunk.Entity;
    import net.noiseinstitute.flight_of_the_cobra.IMovementBehaviour;
    import net.noiseinstitute.flight_of_the_cobra.IShootingBehaviour;
    import net.noiseinstitute.flight_of_the_cobra.Main;
    import net.noiseinstitute.flight_of_the_cobra.Supplier;
    import net.noiseinstitute.flight_of_the_cobra.Thargoid;

    public class Wave extends Entity {
        private var _supplier:Supplier;
        private var _spawnInterval:int;
        private var _spawnX:Number;
        private var _spawnY:Number;
        private var _movement:IMovementBehaviour;
        private var _shooting:IShootingBehaviour;
        private var _frame:int=0;

        public function Wave(supplier:Supplier, spawnInterval:int,
                spawnX:Number, spawnY:Number,
                movement:IMovementBehaviour, shooting:IShootingBehaviour) {
            _supplier = supplier;
            _spawnInterval = spawnInterval;
            _spawnX = spawnX;
            _spawnY = spawnY;
            _movement = movement;
            _shooting = shooting;
        }

        public override function update():void {
            if (_frame++ % _spawnInterval == 0) {
                var thargoid:Thargoid = _supplier.getThargoid();
                thargoid.init(_movement, _shooting);
                thargoid.x = _spawnX;
                thargoid.y = _spawnY;
            }
        }
    }
}
