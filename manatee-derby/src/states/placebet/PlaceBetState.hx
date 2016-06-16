package states.placebet;

import haxe.ds.HashMap;
import openfl.display.Bitmap;
import openfl.display.SpreadMethod;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import serv.Services;
import states.State;

/**
 * ...
 * @author Nick Ivens
 */
class PlaceBetState extends State
{
	
	public function new(srvcs:Services) 
	{
		super(srvcs);
		initVars();
		initGraphics();
		initEvents();
		startBGMusic();
	}
	
	private var sortedRacers:Array<Manatee>;
	
	private function initVars():Void
	{
		sortedRacers  = new Array<Manatee>();
		for (manatee in services.getData().getRacers()) {
			sortedRacers.push(manatee);	
		}
		sortedRacers.sort( function(a:Manatee, b:Manatee):Int {
			if (a.getRating() < b.getRating()) return -1;
			if (a.getRating() > b.getRating()) return 1;
			return 0;
		} );
		
		for (i in 0...4) {
			sortedRacers[i].setOdds(i + 2);
		}
	}
	
	private var buttonBack:Sprite;
	private var bet1:BettingButton;
	private var bet2:BettingButton;
	private var bet3:BettingButton;
	private var bet4:BettingButton;
	
	private function initGraphics():Void 
	{
		var bg:Bitmap = new Bitmap(services.getArt().getByName("placebet_bg"));
		addChild(bg);
		
		bet1 = new BettingButton(this, services, sortedRacers[0].getName(), sortedRacers[0].getOdds());
		addChild(bet1);
		bet1.x = 200;
		bet1.y = 100;
		
		bet2 = new BettingButton(this, services, sortedRacers[1].getName(), sortedRacers[1].getOdds());
		addChild(bet2);
		bet2.x = 200;
		bet2.y = 200;
		
		bet3 = new BettingButton(this, services, sortedRacers[2].getName(), sortedRacers[2].getOdds());
		addChild(bet3);
		bet3.x = 200;
		bet3.y = 300;
	
		bet4 = new BettingButton(this, services, sortedRacers[3].getName(), sortedRacers[3].getOdds());
		addChild(bet4);
		bet4.x = 200;
		bet4.y = 400;
		
		var cashTxt = new TextField();
		addChild(cashTxt);
		cashTxt.height = 30;
		cashTxt.x = 220;
		cashTxt.y = 520;
		cashTxt.text = "Cash: $" + services.getData().getCash();
		
		buttonBack = new Sprite();
		var btnBackImg:Bitmap = new Bitmap(services.getArt().getByName("btn_back"));
		buttonBack.addChild(btnBackImg);
		addChild(buttonBack);
		buttonBack.x = 765;
		buttonBack.y = 450;
		
	}
	
	public function createBet(name:String, bet:Int):Void
	{
		services.getData().createBet(name, bet);
		services.getData().spend(bet);
		callNewState(StateEnum.PLACE_BET);
	}
	
	public function initEvents():Void
	{
		buttonBack.addEventListener(MouseEvent.CLICK, handleBtnBack);
	}
	
	private function handleBtnBack(e:MouseEvent):Void 
	{
		callNewState(StateEnum.RACE_CARD);
	}
	
	private function startBGMusic():Void
	{
		services.getAudio().playSongByName("placebet_bg");
	}
	
	//overrides
	override public function update():Void 
	{
		super.update();
	}
	
	override public function unload():Void 
	{
		super.unload();
	}
	
	//accessors
}