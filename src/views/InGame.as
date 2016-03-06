package views {

    import controllers.Controller;

    import models.Model;

    import starling.display.Sprite;
    import starling.display.Stage;

    public class InGame extends Sprite {
        private var model:Model;
        private var controller:Controller;

        public function InGame(aModel:Model, oController:Controller, target:Stage) {
            super();
            this.model = aModel;
            this.controller = oController;
        }

        public function disposeTemporarily():void{
            this.visible = false;
        }

        public function initialize():void{
            this.visible = true;
        }
    }
}
