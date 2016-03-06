package models {

  import flash.geom.Rectangle;

  public class Settings {

    private static const STAGE_WIDTH:int = 320;
    private static const STAGE_HEIGHT:int = 480;
    private static var _viewPortSize:Rectangle;
    private static var _scaleFactor:int;

    public function Settings(){

    }

    public static function getStageWidth():uint{
      return STAGE_WIDTH;
    }

    public static function getStageHeight():uint{
      return STAGE_HEIGHT;
    }

    public static function setViewPort(viewPort:Rectangle):void{
      _viewPortSize = viewPort;
    }

    public static function getViewPort():Rectangle{
      return _viewPortSize;
    }

    public static function setScaleFactor(scale:int):void{
      _scaleFactor = scale;
    }

    public static function getScaleFactor():int{
      return _scaleFactor;
    }
  }
}