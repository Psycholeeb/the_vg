package views {

    import controllers.NavigationEvent;

    import models.Assets;

    import starling.display.Button;
    import starling.display.Image;
    import starling.display.Sprite;
    import starling.events.Event;

    public class InGame extends Sprite {
        private var _bgInGame:Image;
        private var _btnSettings:Button;
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

            _btnSettings = new Button(Assets.getTextureFromMenuAtlas("btnSettings"));
            _btnSettings.x = stage.width - (_btnSettings.width/3);
            _btnSettings.y = 10;
            _btnSettings.scaleX = _btnSettings.scaleY = 0.3;
            this.addChild(_btnSettings);

            for(var i:int = 0; i<9; i++){
                for(var j:int = 0; j<6; j++){
                    _elementUnselected = new Button(Assets.getTextureFromMenuAtlas("elementUnselected"));
                    _elementUnselected.scaleX = _elementUnselected.scaleY = 0.6;
                    _elementUnselected.x = _elementUnselected.width * i;
                    _elementUnselected.y = (this.stage.stageHeight/2)+(_elementUnselected.height * j);
                    this.addChild(_elementUnselected);
                }
            }
            this.addEventListener(Event.TRIGGERED, onMainMenuClick);
        }

        private function onMainMenuClick(e:Event):void{
            var buttonClicked:Button = e.target as Button;

            if((buttonClicked as Button) == _btnSettings){
                this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "menu"}, true));
            }
        }

        public function disposeTemporarilyGame():void{
            this.visible = false;
        }

        public function initializeGame():void{
            this.visible = true;
        }
    }
}
