package {
    import events.NavigationEvent;
    import screens.GameMenu;
    import screens.inGame;
    import starling.display.Sprite;
    import starling.events.Event;

    public class Game extends Sprite
    {
        public var gameWelcomeMenu:GameMenu;
        public var screenInGame:inGame;

        public function Game() {
            super();
            this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }

        private function onAddedToStage(event:Event):void{
            gameWelcomeMenu = new GameMenu();
            this.addChild(gameWelcomeMenu);

            this.addEventListener(NavigationEvent.CHANGE_SCREEN, onChangeScreen);

            screenInGame = new inGame();
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
