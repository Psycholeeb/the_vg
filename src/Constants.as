package {
    import utils.GameSettingsStruct;

    import starling.errors.AbstractClassError;

    public class Constants
    {
        public function Constants() { throw new AbstractClassError(); }

        public static const STAGE_WIDTH:int  = 320;
        public static const STAGE_HEIGHT:int = 480;
        public static const BUTTON_SIZE:int = 32;


        //PREDEFINED LEVEL
        public static const BEGINNER_SETTINGS:GameSettingsStruct = new GameSettingsStruct(9,9,10);
        public static const INTERMEDIATE_SETTINGS:GameSettingsStruct = new GameSettingsStruct(16,16,40);
        public static const EXPERT_SETTINGS:GameSettingsStruct = new GameSettingsStruct(24,20,99);
        public static const LEVELS_SETTINGS:Vector.<GameSettingsStruct> = new <GameSettingsStruct>[BEGINNER_SETTINGS,INTERMEDIATE_SETTINGS,EXPERT_SETTINGS];
    }
}