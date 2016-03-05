package views {
    import controllers.NavigationEvent;

    import flash.geom.Rectangle;

    import models.Assets;

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
        private var _btnExitGame:Button;
        private var _viewPort;

        public function GameMenu() {
            super();
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }

        private function onAddedToStage(event:Event):void {
            drawScreen();
        }

        private function drawScreen():void{
            _bgMenu = new Image(Assets.getTexture("bgMenu"));
            _bgMenu.x = stage.x;
            _bgMenu.y = stage.y;
            _bgMenu.height = stage.stageHeight;
            _bgMenu.width = stage.stageWidth;
            this.addChild(_bgMenu);

            _titleGameMenu = new Image(Assets.getTextureFromMenuAtlas("titleGameMenu"));
            _titleGameMenu.height = 150;
            _titleGameMenu.width = 150;
            _titleGameMenu.x = (stage.stageWidth/2)-(_titleGameMenu.width/2);
            _titleGameMenu.y = 40;
            this.addChild(_titleGameMenu);

            _btnStartGame = new Button(Assets.getTextureFromMenuAtlas("btnStartGame"));
            _btnStartGame.height = 50;
            _btnStartGame.width = 100;
            _btnStartGame.x = (stage.stageWidth/2)-(_btnStartGame.width/2);
            _btnStartGame.y = (_titleGameMenu.y + _titleGameMenu.height + 60);
            this.addChild(_btnStartGame);

            _btnSettings = new Button(Assets.getTextureFromMenuAtlas("btnSettings"));
            _btnSettings.height = 50;
            _btnSettings.width = 100;
            _btnSettings.x = (stage.stageWidth/2)-(_btnSettings.width/2);
            _btnSettings.y = (_btnStartGame.y + _btnStartGame.height + 40);
            this.addChild(_btnSettings);

            _btnExitGame = new Button(Assets.getTextureFromMenuAtlas("btnExitGame"));
            _btnExitGame.height = 50;
            _btnExitGame.width = 100;
            _btnExitGame.x = (stage.stageWidth/2)-(_btnExitGame.width/2);
            _btnExitGame.y = (_btnSettings.y + _btnSettings.height + 40);
            this.addChild(_btnExitGame);

            this.addEventListener(Event.TRIGGERED, onMainMenuClick);
        }

        private function onMainMenuClick(e:Event):void{
            var buttonClicked:Button = e.target as Button;

            if((buttonClicked as Button) == _btnStartGame){
                this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "play"}, true));
            }
        }

        public function disposeTemporarily():void{
            this.visible = false;
        }
    }
}
