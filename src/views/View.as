/**
 * Created by Vlad on 10.01.2016.
 */
package views {

  import controllers.Controller;

  import models.Model;

  import starling.display.Stage;

  public class View {
    private var model:Model;
    private var controller:Controller;


    public function View(aModel:Model, oController:Controller, target:Stage){
      this.model = aModel;
      this.controller = oController;
    }
  }
}
