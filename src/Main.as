package {

  import controllers.Controller;

  import flash.display.Bitmap;
  import flash.display.Sprite;
  import flash.filesystem.File;
  import flash.geom.Rectangle;
  import flash.system.Capabilities;

  import models.Model;

  import starling.core.Starling;
  import starling.events.Event;
  import starling.utils.AssetManager;
  import starling.utils.RectangleUtil;
  import starling.utils.ScaleMode;
  import starling.utils.formatString;

  import views.View;

  [SWF(frameRate="30", backgroundColor="#FFFFFF")]

  public class Main extends Sprite {
    [Embed(source="../assets/fonts/comicbd.ttf", embedAsCFF="false", fontFamily="comicbd")]
    private static const UbuntuRegular:Class;

    [Embed(source="../assets/graphics/1x/startup/startup.jpg")]
    private static var Background:Class;

    [Embed(source="../assets/graphics/2x/startup/startupHD.jpg")]
    private static var BackgroundHD:Class;

    private var starling:Starling;
    public var background:Bitmap;
    private var assets:AssetManager;

    public function Main(){
      var stageWidth:int = Constants.STAGE_WIDTH;
      var stageHeight:int = Constants.STAGE_HEIGHT;
      var iOS:Boolean = Capabilities.manufacturer.indexOf("iOS") != -1;

      Starling.multitouchEnabled = false;
      Starling.handleLostContext = !iOS;

      var viewPort:Rectangle = RectangleUtil.fit(new Rectangle(0, 0, stageWidth, stageHeight), new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight), ScaleMode.SHOW_ALL);

      var scaleFactor:int = viewPort.width < 480 ? 1 : 2; // midway between 320 and 640
      var appDir:File = File.applicationDirectory;
      assets = new AssetManager(scaleFactor);

      assets.verbose = Capabilities.isDebugger;
      assets.enqueue(appDir.resolvePath("audio"), appDir.resolvePath(formatString("fonts/{0}x", scaleFactor)), appDir.resolvePath(formatString("textures/{0}x", scaleFactor)));

      background = scaleFactor == 1 ? new Background() : new BackgroundHD();
      Background = BackgroundHD = null; // no longer needed!

      background.x = viewPort.x;
      background.y = viewPort.y;
      background.width = viewPort.width;
      background.height = viewPort.height;
      background.smoothing = true;
      addChild(background);

      starling = new Starling(Root, stage, viewPort);
      starling.stage.stageWidth = stageWidth;
      starling.stage.stageHeight = stageHeight;
      starling.simulateMultitouch = false;
      starling.enableErrorChecking = Capabilities.isDebugger;

      starling.addEventListener(Event.ROOT_CREATED, onCreatedRoot);
    }

    private function onCreatedRoot(event:Object, app:Root):void{
      starling.removeEventListener(Event.ROOT_CREATED, onCreatedRoot);
      removeChild(background);

      app.start(null, assets);

      var model:Model = new Model();
      var controller:Controller = new Controller(model);
      var view:View = new View(model, controller, this.starling.stage);

      starling.start();
    }
  }
}