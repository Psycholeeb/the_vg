package controllers {
    import controllers.NavigationEvent;
    import views.GameMenu;
    import views.InGame;
    import starling.display.Sprite;
    import starling.events.Event;

    public class Game extends Sprite
    {
        public var gameWelcomeMenu:GameMenu;
        public var screenInGame:InGame;

        public function Game() {
            super();
            this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }

        private function onAddedToStage(event:Event):void{
            gameWelcomeMenu = new GameMenu();
            this.addChild(gameWelcomeMenu);

            this.addEventListener(NavigationEvent.CHANGE_SCREEN, onChangeScreen);

            screenInGame = new InGame();
            screenInGame.disposeTemporarily();
            this.addChild(screenInGame);
        }

        private function onChangeScreen(e:NavigationEvent):void{
            switch (e.params.id){
                case "play":
                        gameWelcomeMenu.disposeTemporarily();
                        screenInGame.initialize();
                    break;
            }
        }
    }
}
