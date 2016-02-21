/**
 * Created by Vlad on 21.02.2016.
 */
package {

  public class EmbeddedAssets {

    [Embed(source="../assets/graphics/2x/ingameAtlas.xml", mimeType="application/octet-stream")]
    public static const IngameAtlasXml:Class;

    [Embed(source="../assets/graphics/2x/ingameAtlas.png")]
    public static const IngameAtlasTexture:Class;

    public function EmbeddedAssets(){
    }
  }
}
