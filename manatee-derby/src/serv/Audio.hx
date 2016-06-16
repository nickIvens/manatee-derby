package serv;
import openfl.media.Sound;
import openfl.media.SoundChannel;

/**
 * ...
 * @author Nick Ivens
 */
class Audio
{
	private var audioMap:Map<String, Sound> = new Map();
	private var currentlyPlaying:String;
	private var music:Sound;
	private var channel:SoundChannel;
	
	public function new() 
	{
		// Assets:
		audioMap.set("title_bg", openfl.Assets.getSound("sound/title_bg.ogg"));
		audioMap.set("menu_bg", openfl.Assets.getSound("sound/menu_bg.ogg"));
		audioMap.set("ranch_bg", openfl.Assets.getSound("sound/ranch_bg.ogg"));
		audioMap.set("race_bg", openfl.Assets.getSound("sound/race_bg.ogg"));
		audioMap.set("mart_bg", openfl.Assets.getSound("sound/mart_bg.ogg"));
		audioMap.set("placebet_bg", openfl.Assets.getSound("sound/placebet_bg.ogg"));
		audioMap.set("racecard_bg", openfl.Assets.getSound("sound/racecard_bg.ogg"));
		
		currentlyPlaying = "";
	}
	
	public function playSongByName(name:String):Void
	{
		if (name != currentlyPlaying) {
			if (channel != null) channel.stop();
			currentlyPlaying = name;
			music = audioMap.get(name);
			channel = music.play();
		}
	}
	
}