/**
 * Created by Vlad on 10.01.2016.
 */
package views {

  import controllers.Controller;

  import models.Model;

  import starling.display.Image;

  import starling.display.Sprite;
  import starling.display.Stage;

  public class View extends Sprite{
    private var model:Model;
    private var controller:Controller;
    private var grided:Image;


    public function View(aModel:Model, oController:Controller, target:Stage){
      this.model = aModel;
      this.controller = oController;

      //gridGenerate();
    }

    private function gridGenerate():void{

    }
  }
}
