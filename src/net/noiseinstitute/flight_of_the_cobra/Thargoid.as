package net.noiseinstitute.flight_of_the_cobra {
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Image;

    public class Thargoid extends Entity {
        [Embed(source="Thargoid.png")]
        private static const ThargoidSprite:Class;

        [Embed(source="Pop.png")]
        private static const DeadSprite:Class;

        private static const DEAD_TIME:int = 12;

        private var _normalGraphic:Image = new Image(ThargoidSprite);
        private var _deadGraphic:Image = new Image(DeadSprite);
        private var _movementBehaviour:IMovementBehaviour;
        private var _shootingBehaviour:IShootingBehaviour;
        private var _dead:Boolean = false;
        private var _frame:int;

        public function Thargoid () {
            _normalGraphic.x = -_normalGraphic.width*0.5;
            _normalGraphic.y = -_normalGraphic.height*0.5;
            _deadGraphic.x = -_deadGraphic.width*0.5;
            _deadGraphic.y = -_deadGraphic.height*0.5;

            super(0, 0, _normalGraphic);

            setHitboxTo(_normalGraphic);

            collidable = false;
            visible = false;
        }

        public function set movementBehaviour(movementBehaviour:IMovementBehaviour):void {
            _movementBehaviour = movementBehaviour;
        }

        public function init(movementBehaviour:IMovementBehaviour, shootingBehaviour:IShootingBehaviour):void {
            type = "enemy";
            active = true;
            collidable = true;
            visible = true;
            graphic = _normalGraphic;
            _movementBehaviour = movementBehaviour;
            _shootingBehaviour = shootingBehaviour;
            _dead = false;
            _frame = 0;
        }

        public function kill ():void {
            type = null;
            collidable = false;
            graphic = _deadGraphic;
            _movementBehaviour = null;
            _shootingBehaviour = null;
            _dead = true;
            _frame = 0;
        }

        public function dispose():void {
            type = null;
            active = false;
            collidable = false;
            visible = false;
        }

        override public function update():void {
            if (_dead) {
                if (_frame > DEAD_TIME) {
                    dispose();
                }
            } else {
                if (_movementBehaviour != null) {
                    _movementBehaviour.update(this, _frame);
                }
                if (_shootingBehaviour != null) {
                    _shootingBehaviour.update(this, _frame);
                }
                super.update();
            }
            ++_frame;
        }
    }
}
