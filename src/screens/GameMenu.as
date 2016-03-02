package screens {
    import events.NavigationEvent;

    import starling.display.Button;
    import starling.display.Image;
    import starling.display.Sprite;
    import starling.events.Event;

    public class GameMenu extends Sprite {

        private var _bgMenu:Image;
        private var _titleGameMenu:Image;
        private var _btnStartGame:Button;
        private var _btnSettings:Button;
        private var _btnExitGame:Button;

        public function GameMenu() {
            super();
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }

        private function onAddedToStage(event:Event):void {
            drawScreen();
        }

        private function drawScreen():void{
            _bgMenu = new Image(Assets.getTexture("bgMenu"));
            this.addChild(_bgMenu);

            _titleGameMenu = new Image(Assets.getTextureFromMenuAtlas("titleGameMenu"));
            _titleGameMenu.x = (stage.stageWidth/2)-(_titleGameMenu.width/2);
            _titleGameMenu.y = 40;
            this.addChild(_titleGameMenu);

            _btnStartGame = new Button(Assets.getTextureFromMenuAtlas("btnStartGame"));
            _btnStartGame.x = (stage.stageWidth/2)-(_btnStartGame.width/2);
            _btnStartGame.y = (_titleGameMenu.y + _titleGameMenu.height + 60);
            this.addChild(_btnStartGame);

            _btnSettings = new Button(Assets.getTextureFromMenuAtlas("btnSettings"));
            _btnSettings.x = (stage.stageWidth/2)-(_btnSettings.width/2);
            _btnSettings.y = (_btnStartGame.y + _btnStartGame.height + 40);
            this.addChild(_btnSettings);

            _btnExitGame = new Button(Assets.getTextureFromMenuAtlas("btnExitGame"));
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
