package serv;

import openfl.display.BitmapData;

/**
 * ...
 * @author Nick Ivens
 */
class Artwork
{
	private var artMap:Map<String, BitmapData> = new Map();
	
	public function new() 
	{
		// Assets:
		artMap.set("title_bg", openfl.Assets.getBitmapData("img/title_bg.png"));
	}
	
	public function getByName(name:String):BitmapData
	{
		return artMap[name];
	}
	
}