/**
 * Created by Vlad on 10.01.2016.
 */
package models {

  import starling.events.Event;
  import starling.events.EventDispatcher;

  public class Model extends EventDispatcher {
    //[Embed(source="../../assets/textures/""x/menuSprite.xml", mimeType="application/octet-stream")]
    private static const menuSpriteXml:Class;

    //[Embed(source="../../assets/textures/2x/menuSprite.png")]
    private static const menuSprite:Class;

    public function Model(){
      super();
    }

    public function setKey(key:uint):void{
      //this.lastKeyPressed = key;
      //dispatchEvent(new Event(Event.CHANGE));
    }

    //public function getKey():uint{
      //return lastKeyPressed;
    //}
  }
}
