package {

    import controllers.Controller;
    import controllers.Game;

    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.filesystem.File;
    import flash.geom.Rectangle;
    import flash.system.Capabilities;

    import models.Settings;

    import models.Model;

    import starling.utils.formatString;

    import views.GameMenu;

    import starling.core.Starling;
    import starling.utils.AssetManager;
    import starling.utils.RectangleUtil;
    import starling.utils.ScaleMode;

    import views.InGame;

    [SWF(frameRate="30", backgroundColor="#CCCCCC")]

    public class Main extends Sprite {
        [Embed(source="../assets/fonts/comicbd.ttf", embedAsCFF="false", fontFamily="comicbd")]
        private static const UbuntuRegular:Class;

        [Embed(source="../assets/graphics/1x/startup/startup.jpg")]
        private static var Background:Class;

        [Embed(source="../assets/graphics/2x/startup/startupHD.jpg")]
        private static var BackgroundHD:Class;

        private var _starling:Starling;
        private var _background:Bitmap;
        public var _assets:AssetManager;

        public function Main(){
            var stageWidth:int = models.Settings.getStageWidth();
            var stageHeight:int = models.Settings.getStageHeight();
            var iOS:Boolean = Capabilities.manufacturer.indexOf("iOS") != -1;

            Starling.multitouchEnabled = false;
            Starling.handleLostContext = !iOS;

            var viewPortSize = RectangleUtil.fit(new Rectangle(0, 0, stageWidth, stageHeight), new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight), ScaleMode.SHOW_ALL);
            models.Settings.setViewPort(viewPortSize);

            var scaleFactor:int = viewPortSize.width < 480 ? 1 : 2; // midway between 320 and 640
            models.Settings.setScaleFactor(scaleFactor);

            //var appDir:File = File.applicationDirectory;
            _assets = new AssetManager(scaleFactor);
            _assets.loadQueue(function(ratio:Number):void{
                trace("Loading assets, progress:", ratio);
            });

            //_assets.verbose = Capabilities.isDebugger;
            //_assets.verbose = true;
            //_assets.enqueue(appDir.resolvePath("audio"), appDir.resolvePath(formatString("fonts/{0}x", scaleFactor)), appDir.resolvePath(formatString("textures/{0}x", scaleFactor)));
            //_assets.enqueue(EmbeddedAssets);

            //firstPresentationImage(scaleFactor, viewPortSize);

            _starling = new Starling(Game, stage, viewPortSize);
            //_starling.stage.stageWidth = stageWidth;
            //_starling.stage.stageHeight = stageHeight;
            _starling.simulateMultitouch = false;
            _starling.enableErrorChecking = Capabilities.isDebugger;

            afterInit();
        }

        /*private function firstPresentationImage(scaleFactor, viewPort):void{
            _background = scaleFactor == 1 ? new Background() : new BackgroundHD();
            Background = BackgroundHD = null; // no longer needed!

            _background.x = viewPort.x;
            _background.y = viewPort.y;
            _background.width = viewPort.width;
            _background.height = viewPort.height;
            _background.smoothing = true;

            this.addChild(_background);
        }*/

        private function afterInit():void{
            var model:Model = new Model();
            var controller:Controller = new Controller(model);

            _starling.antiAliasing = 1;
            // Show statistics for memory usage and fps.
            _starling.showStats = true;
            _starling.showStatsAt("left", "bottom");

            _starling.start();
        }
    }
}