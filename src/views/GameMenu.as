package views {

    import controllers.Controller;
    import controllers.NavigationEvent;

    import flash.geom.Rectangle;

    import models.Assets;
    import models.Model;

    import starling.display.Button;
    import starling.display.DisplayObject;
    import starling.display.Image;
    import starling.display.Sprite;
    import starling.events.Event;

    public class GameMenu extends Sprite {

        private var _bgMenu:Image;
        private var _titleGameMenu:Image;
        private var _btnStartGame:Button;
        private var _btnSettings:Button;
        private var _btnSound:Button;
        private var _viewPort;

        private var model:Model;
        private var controller:Controller;

        public function GameMenu() {
            super();
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }

        private function onAddedToStage(event:Event):void {
            drawScreen();
        }

        private function drawScreen():void{
            _bgMenu = new Image(Assets.getTexture("bgSceneMenu"));
            _bgMenu.x = stage.x;
            _bgMenu.y = stage.y;
            _bgMenu.height = stage.stageHeight;
            _bgMenu.width = stage.stageWidth;
            this.addChild(_bgMenu);

            _btnStartGame = new Button(Assets.getTextureFromMenuAtlas("btnStartGame"));
            _btnStartGame.scaleX = _btnStartGame.scaleY = 0.3;
            _btnStartGame.x = (stage.stageWidth/2)-(_btnStartGame.width/2);
            _btnStartGame.y = (stage.stageHeight/3);
            this.addChild(_btnStartGame);

            _btnSettings = new Button(Assets.getTextureFromMenuAtlas("btnSettings"));
            _btnSettings.scaleX = _btnSettings.scaleY = 0.3;
            _btnSettings.x = (stage.stageWidth/2)-(_btnSettings.width/2);
            _btnSettings.y = (_btnStartGame.y + _btnStartGame.height + 40);
            this.addChild(_btnSettings);

            _btnSound = new Button(Assets.getTextureFromMenuAtlas("btnSound"));
            _btnSound.scaleX = _btnSound.scaleY = 0.3;
            _btnSound.x = (stage.stageWidth/2)-(_btnSound.width/2);
            _btnSound.y = (_btnSettings.y + _btnSettings.height + 40);
            this.addChild(_btnSound);

            this.addEventListener(Event.TRIGGERED, onMainMenuClick);
        }

        private function onMainMenuClick(e:Event):void{
            //trace((e.target as Button) == _btnStartGame);
            var buttonClicked:Button = e.target as Button;

            if((buttonClicked as Button) == _btnStartGame){
                this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "play"}, true));
            }
        }

        public function disposeTemporarily():void{
            this.visible = false;
        }

        public function initialize():void{
            this.visible = true;
        }
    }
}
