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
		artMap.set("manatee5", openfl.Assets.getBitmapData("img/manatee5.png"));
		artMap.set("manatee6", openfl.Assets.getBitmapData("img/manatee6.png"));
		artMap.set("btn_watch", openfl.Assets.getBitmapData("img/btn_watch.png"));
		artMap.set("btn_bet", openfl.Assets.getBitmapData("img/btn_bet.png"));
		artMap.set("placebet_bg", openfl.Assets.getBitmapData("img/placebet_bg.png"));
		artMap.set("arrowL", openfl.Assets.getBitmapData("img/arrowL.png"));
		artMap.set("arrowR", openfl.Assets.getBitmapData("img/arrowR.png"));
		artMap.set("btn_buy", openfl.Assets.getBitmapData("img/btn_buy.png"));
		artMap.set("btn_sell", openfl.Assets.getBitmapData("img/btn_sell.png"));
		artMap.set("btn_train", openfl.Assets.getBitmapData("img/btn_train.png"));
		artMap.set("btn_feed", openfl.Assets.getBitmapData("img/btn_feed.png"));
		artMap.set("btn_enter", openfl.Assets.getBitmapData("img/btn_enter.png"));
		artMap.set("btn_back", openfl.Assets.getBitmapData("img/btn_back.png"));
		artMap.set("btn_yes", openfl.Assets.getBitmapData("img/btn_yes.png"));
		artMap.set("btn_no", openfl.Assets.getBitmapData("img/btn_no.png"));
		artMap.set("btn_ok", openfl.Assets.getBitmapData("img/btn_ok.png"));
		artMap.set("confirm_bg", openfl.Assets.getBitmapData("img/confirm_bg.png"));
		artMap.set("confirmfeed_bg", openfl.Assets.getBitmapData("img/confirmfeed_bg.png"));
		artMap.set("confirmnomoney_bg", openfl.Assets.getBitmapData("img/confirmnomoney_bg.png"));
		artMap.set("confirmtrain_bg", openfl.Assets.getBitmapData("img/confirmtrain_bg.png"));
		artMap.set("no_manatees", openfl.Assets.getBitmapData("img/no_manatees.png"));
	}
	
	public function getByName(name:String):BitmapData
	{
		return artMap[name];
	}
	
}