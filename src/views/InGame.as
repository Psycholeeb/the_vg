package views {
    import starling.display.Sprite;

    public class InGame extends Sprite {

        public function InGame() {
            super();
        }

        public function disposeTemporarily():void{
            this.visible = false;
        }

        public function initialize():void{
            this.visible = true;
        }
    }
}
