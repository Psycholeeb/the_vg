/**
 * Created by Vlad on 10.01.2016.
 */
package models {

    import starling.events.Event;
    import starling.events.EventDispatcher;

    public class Model extends EventDispatcher{
        private var lastKeyPressed:uint = 0;

        public function Model() {
            super();
        }

        public function setKey(key:uint):void{
            this.lastKeyPressed = key;
            dispatchEvent(new Event(Event.CHANGE));
        }

        public function getKey():uint{
            return lastKeyPressed;
        }
    }
}
