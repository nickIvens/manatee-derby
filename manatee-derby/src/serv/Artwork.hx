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
		artMap.set("btn_ranch", openfl.Assets.getBitmapData("img/btn_ranch.png"));
		artMap.set("btn_mart", openfl.Assets.getBitmapData("img/btn_mart.png"));
		artMap.set("btn_races", openfl.Assets.getBitmapData("img/btn_races.png"));
		artMap.set("ranch_bg", openfl.Assets.getBitmapData("img/ranch_bg.png"));
		artMap.set("mart_bg", openfl.Assets.getBitmapData("img/mart_bg.png"));
		artMap.set("races_bg", openfl.Assets.getBitmapData("img/races_bg.png"));
	}
	
	public function getByName(name:String):BitmapData
	{
		return artMap[name];
	}
	
}