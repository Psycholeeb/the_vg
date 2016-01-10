package {

    import events.EventsList;

    import starling.display.Sprite;
    import starling.events.Event;
    import starling.textures.Texture;
    import starling.utils.AssetManager;

    public class Root extends Sprite{
        private static var sAssets:AssetManager;
        private var mActiveScene:Sprite;

        public function Root() {
            addEventListener(EventsList.START_GAME, onStartGame);
            addEventListener(EventsList.SETTINGS, onSettings);
            trace("Root TEST OK!");
        }

        public function start(background:Texture, assets:AssetManager):void {
            sAssets = assets;
        }

        public static function get assets():AssetManager { return sAssets; }

        private function onStartGame(event:Event):void {
            //showScene(Game);
        }

        private function onSettings():void {
            //showScene(GameSettingsView);
        }

        private function showScene(screen:Class):void {
            if(mActiveScene)mActiveScene.removeFromParent(true);
            mActiveScene = new screen();
            addChild(mActiveScene);
        }
    }
}
