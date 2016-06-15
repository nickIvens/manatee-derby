package serv;
import openfl.media.Sound;

/**
 * ...
 * @author Nick Ivens
 */
class Audio
{
	private var audioMap:Map<String, Sound> = new Map();
	
	public function new() 
	{
		// Assets:
		//audioMap.set("title_bg", openfl.Assets.getMusic("sound/title_bg.ogg"));
	}
	
	public function getByName(name:String):Sound
	{
		return audioMap[name];
	}
	
}