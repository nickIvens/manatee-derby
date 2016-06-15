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
		artMap.set("menu_bg", openfl.Assets.getBitmapData("img/menu_bg.png"));
		artMap.set("btn_ranch", openfl.Assets.getBitmapData("img/btn_ranch.png"));
		artMap.set("btn_mart", openfl.Assets.getBitmapData("img/btn_mart.png"));
		artMap.set("btn_races", openfl.Assets.getBitmapData("img/btn_races.png"));
		artMap.set("ranch_bg", openfl.Assets.getBitmapData("img/ranch_bg.png"));
		artMap.set("mart_bg", openfl.Assets.getBitmapData("img/mart_bg.png"));
		artMap.set("races_bg", openfl.Assets.getBitmapData("img/races_bg.png"));
		artMap.set("raceover_bg", openfl.Assets.getBitmapData("img/raceover_bg.png"));
		artMap.set("racecard_bg", openfl.Assets.getBitmapData("img/racecard_bg.png"));
		artMap.set("manatee", openfl.Assets.getBitmapData("img/manatee.png"));
		artMap.set("manatee1", openfl.Assets.getBitmapData("img/manatee1.png"));
		artMap.set("manatee2", openfl.Assets.getBitmapData("img/manatee2.png"));
		artMap.set("manatee3", openfl.Assets.getBitmapData("img/manatee3.png"));
		artMap.set("manatee4", openfl.Assets.getBitmapData("img/manatee4.png"));
		artMap.set("btn_watch", openfl.Assets.getBitmapData("img/btn_watch.png"));
		artMap.set("btn_bet", openfl.Assets.getBitmapData("img/btn_bet.png"));
		artMap.set("placebet_bg", openfl.Assets.getBitmapData("img/placebet_bg.png"));
		artMap.set("arrowL", openfl.Assets.getBitmapData("img/arrowL.png"));
		artMap.set("arrowR", openfl.Assets.getBitmapData("img/arrowR.png"));
		artMap.set("btn_buy", openfl.Assets.getBitmapData("img/btn_buy.png"));
		artMap.set("btn_back", openfl.Assets.getBitmapData("img/btn_back.png"));
		artMap.set("confirmbuy_bg", openfl.Assets.getBitmapData("img/confirmbuy_bg.png"));
	}
	
	public function getByName(name:String):BitmapData
	{
		return artMap[name];
	}
	
}