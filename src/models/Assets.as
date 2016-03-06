package models {
    import flash.display.Bitmap;
    import flash.utils.Dictionary;
    import starling.textures.Texture;
    import starling.textures.TextureAtlas;

    public class Assets {
      [Embed(source="../../assets/bgSceneMenu.png")]
      public static const bgSceneMenu:Class;
      [Embed(source="../../assets/bgSceneInGame.png")]
      public static const bgSceneInGame:Class;
      [Embed(source="../../assets/menuSprite.png")]
      public static const menuAtlas:Class;
      [Embed(source="../../assets/menuSprite.xml", mimeType="application/octet-stream")]
      public static const menuAtlasXml:Class;

      private static var gameTexture:Dictionary = new Dictionary();

      public static function getTexture(name:String):Texture{
        if (gameTexture[name] == undefined){
          var bitmap:Bitmap = new Assets[name]();
          gameTexture[name] = Texture.fromBitmap(bitmap);
        }
        return gameTexture[name];
      }

      public static function getTextureFromMenuAtlas(nameTextureInAtlas:String):Texture{
        var texture:Texture = Texture.fromEmbeddedAsset(Assets.menuAtlas);
        var xml:XML = XML(new Assets.menuAtlasXml);
        var atlas:TextureAtlas = new TextureAtlas(texture, xml);
        var gameTexture:Texture = atlas.getTexture(nameTextureInAtlas);
        return gameTexture;
      }
    }
}