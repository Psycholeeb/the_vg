package models {

  import flash.geom.Rectangle;

  public class Constants {

    private static const STAGE_WIDTH:int = 320;
    private static const STAGE_HEIGHT:int = 480;
    private static var viewPortSize:Rectangle;

    public function Constants(){

    }

    public static function getStageWidth():uint{
      return STAGE_WIDTH;
    }

    public static function getStageHeight():uint{
      return STAGE_HEIGHT;
    }

    public static function setViewPort(viewPort:Rectangle):void{
      viewPortSize = viewPort;
    }

    public static function getViewPort():Rectangle{
      return viewPortSize;
    }
  }
}