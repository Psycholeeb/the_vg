/**
 * Created by Vlad on 10.01.2016.
 */
package views {

    import controllers.Controller;

    import models.Model;

    import starling.display.Stage;
    import starling.events.Event;
    import starling.events.KeyboardEvent;

    public class View {
        private var model:Model;
        private var controller:Controller;

        public function View(aModel:Model, oController:Controller, target:Stage) {
            this.model = aModel;
            this.controller = oController;

            model.addEventListener(starling.events.Event.CHANGE, this.update);

            target.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
        }

        private function update(event:Event):void{
            trace(model.getKey());
        }

        private function onKeyPress(event:KeyboardEvent):void{
            controller.keyPressHendler(event);
        }
    }
}
