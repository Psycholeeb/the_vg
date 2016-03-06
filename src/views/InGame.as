package views {

    import models.Assets;

    import starling.display.Button;

    import starling.display.Image;

    import starling.display.Sprite;
    import starling.events.Event;

    public class InGame extends Sprite {
        private var _bgInGame:Image;
        private var _elementUnselected:Button;
        private var _elementSelected:Button;

        public function InGame() {
            super();
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }

        private function onAddedToStage():void{
            drawScreen();
        }

        public function disposeTemporarily():void{
            this.visible = false;
        }

        public function initialize():void{
            this.visible = true;
        }

        private function drawScreen():void{
            _bgInGame = new Image(Assets.getTexture("bgSceneInGame"));

            _bgInGame.x = stage.x;
            _bgInGame.y = stage.y;
            _bgInGame.height = this.stage.stageHeight;
            _bgInGame.width = this.stage.stageWidth;
            this.addChild(_bgInGame);

            for(var i:int = 0; i<9; i++){
                _elementUnselected = new Button(Assets.getTextureFromMenuAtlas("elementUnselected"));
                _elementUnselected.scaleX = _elementUnselected.scaleY = 0.6;
                _elementUnselected.x = _elementUnselected.width*i;
                _elementUnselected.y = stage.stageHeight/2;
                this.addChild(_elementUnselected);
            }
        }
    }
}
