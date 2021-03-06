package states.racecard;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import serv.Services;
import states.State;

/**
 * ...
 * @author Nick Ivens
 */
class RaceCardState extends State
{

	public function new(srvcs:Services) 
	{
		super(srvcs);
		initVars();
		initGraphics();
		initEvents();
		startBGMusic();
	}
	
	private var racers:Array<Manatee>;
	private var sortedRacers:Array<Manatee>;
	private function initVars():Void
	{
		racers = services.getData().getRacers();
		
		sortedRacers  = new Array<Manatee>();
		for (manatee in services.getData().getRacers()) {
			sortedRacers.push(manatee);	
		}
		sortedRacers.sort( function(a:Manatee, b:Manatee):Int {
			if (a.getRating() > b.getRating()) return -1;
			if (a.getRating() < b.getRating()) return 1;
			return 0;
		} );
		
		for (i in 0...4) {
			sortedRacers[i].setOdds(i + 2);
		}
	}
	
	private var buttonWatch:Sprite;
	private var buttonBet:Sprite;
	
	private function initGraphics():Void 
	{
		var bg:Bitmap = new Bitmap(services.getArt().getByName("racecard_bg"));
		addChild(bg);
		
		var lane1Txt:TextField = new TextField();
		addChild(lane1Txt);
		lane1Txt.x = 100;
		lane1Txt.y = 200;
		lane1Txt.width = 900;
		lane1Txt.text = "Lane 1: " + racers[0].getName();
		
		var lane2Txt:TextField = new TextField();
		addChild(lane2Txt);
		lane2Txt.x = 100;
		lane2Txt.y = 250;
		lane2Txt.width = 900;
		lane2Txt.text = "Lane 2: " + racers[1].getName();
		
		var lane3Txt:TextField = new TextField();
		addChild(lane3Txt);
		lane3Txt.x = 100;
		lane3Txt.y = 300;
		lane3Txt.width = 900;
		lane3Txt.text = "Lane 3: " + racers[2].getName();
		
		var lane4Txt:TextField = new TextField();
		addChild(lane4Txt);
		lane4Txt.x = 100;
		lane4Txt.y = 350;
		lane4Txt.width = 900;
		lane4Txt.text = "Lane 4: " + racers[3].getName();
		
		var betsTxt:TextField = new TextField();
		addChild(betsTxt);
		betsTxt.x = 100;
		betsTxt.y = 450;
		betsTxt.width = 900;
		betsTxt.text = "";
		for (key in services.getData().getBets().keys()) {
			betsTxt.text += "You have $" + services.getData().getBets().get(key) + " on " + key + "\n";
		}
		
		buttonWatch = new Sprite();
		var btnImg:Bitmap = new Bitmap(services.getArt().getByName("btn_watch"));
		buttonWatch.addChild(btnImg);
		addChild(buttonWatch);
		buttonWatch.x = 640;
		buttonWatch.y = 400;
		
		buttonBet = new Sprite();
		btnImg = new Bitmap(services.getArt().getByName("btn_bet"));
		buttonBet.addChild(btnImg);
		addChild(buttonBet);
		buttonBet.x = 300;
		buttonBet.y = 420;
	}
	
	private function initEvents():Void 
	{
		buttonWatch.addEventListener(MouseEvent.CLICK, handleBtnWatch);
		buttonBet.addEventListener(MouseEvent.CLICK, handleBtnBet);
	}
	
	private function handleBtnBet(e:MouseEvent):Void 
	{
		super.callNewState(StateEnum.PLACE_BET);
	}
	
	private function handleBtnWatch(e:MouseEvent):Void 
	{
		super.callNewState(StateEnum.RACE);
	}
	
	private function startBGMusic():Void
	{
		services.getAudio().playSongByName("racecard_bg");
	}
	
	//overrides
	override public function update():Void 
	{
		super.update();
	}
	
	override public function unload():Void 
	{
		super.unload();
		removeEventListener(MouseEvent.CLICK, handleBtnWatch);
	}
	
	//accessors
}