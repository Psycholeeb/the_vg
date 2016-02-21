/**
 * Created by Vlad on 10.01.2016.
 */
package controllers {

  import models.Model;

  import starling.events.KeyboardEvent;

  public class Controller {
    private var model:Model;

    public function Controller(aModel:Model){
      this.model = aModel;
    }

    public function keyPressHendler(event:KeyboardEvent):void{
     // model.setKey(event.charCode);
    }
  }
}
