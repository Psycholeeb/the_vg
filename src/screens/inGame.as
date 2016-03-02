package screens {
    import starling.display.Sprite;

    public class inGame extends Sprite {

        public function inGame() {
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
