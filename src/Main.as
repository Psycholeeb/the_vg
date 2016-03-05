package {

    import controllers.Controller;

    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.filesystem.File;
    import flash.geom.Rectangle;
    import flash.system.Capabilities;

    import models.Constants;

    import models.Model;

    import views.GameMenu;

    import starling.core.Starling;
    import starling.utils.AssetManager;
    import starling.utils.RectangleUtil;
    import starling.utils.ScaleMode;

    import views.View;

    [SWF(frameRate="30", backgroundColor="#00000")]

    public class Main extends Sprite {
        [Embed(source="../assets/fonts/comicbd.ttf", embedAsCFF="false", fontFamily="comicbd")]
        private static const UbuntuRegular:Class;

        [Embed(source="../assets/graphics/1x/startup/startup.jpg")]
        private static var Background:Class;

        [Embed(source="../assets/graphics/2x/startup/startupHD.jpg")]
        private static var BackgroundHD:Class;

        private var starling:Starling;
        private var background:Bitmap;
        public var assets:AssetManager;

        public function Main(){
            var stageWidth:int = models.Constants.getStageWidth();
            var stageHeight:int = models.Constants.getStageHeight();
            var iOS:Boolean = Capabilities.manufacturer.indexOf("iOS") != -1;

            Starling.multitouchEnabled = false;
            Starling.handleLostContext = !iOS;

            models.Constants.setViewPort(RectangleUtil.fit(new Rectangle(0, 0, stageWidth, stageHeight), new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight), ScaleMode.SHOW_ALL));
            var viewPortSize = models.Constants.getViewPort();

            var scaleFactor:int = viewPortSize.width < 480 ? 1 : 2; // midway between 320 and 640
            var appDir:File = File.applicationDirectory;
            assets = new AssetManager(scaleFactor);
            assets.loadQueue(function(ratio:Number):void{
                trace("Loading assets, progress:", ratio);
            });

            assets.verbose = Capabilities.isDebugger;
            //assets.verbose = true;
            //assets.enqueue(appDir.resolvePath("audio"), appDir.resolvePath(formatString("fonts/{0}x", scaleFactor)), appDir.resolvePath(formatString("textures/{0}x", scaleFactor)));
            //assets.enqueue(EmbeddedAssets);

            //firstPresentationImage(scaleFactor, viewPortSize);

            starling = new Starling(GameMenu, stage, viewPortSize);
            starling.stage.stageWidth = stageWidth;
            starling.stage.stageHeight = stageHeight;
            starling.simulateMultitouch = false;
            starling.enableErrorChecking = Capabilities.isDebugger;

            afterInit();
        }

        /*private function firstPresentationImage(scaleFactor, viewPort):void{
            background = scaleFactor == 1 ? new Background() : new BackgroundHD();
            Background = BackgroundHD = null; // no longer needed!

            background.x = viewPort.x;
            background.y = viewPort.y;
            background.width = viewPort.width;
            background.height = viewPort.height;
            background.smoothing = true;

            this.addChild(background);
        }*/

        private function afterInit():void{
            var model:Model = new Model();
            var controller:Controller = new Controller(model);
            var view:View = new View(model, controller, this.starling.stage);

            starling.start();
        }
    }
}