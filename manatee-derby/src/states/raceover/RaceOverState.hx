package states.raceover;

import openfl.display.Bitmap;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import serv.Services;

/**
 * ...
 * @author Nick Ivens
 */
class RaceOverState extends State
{

	public function new(srvcs:Services) 
	{
		super(srvcs);
		initVars();
		initGraphics();
		initEvents();
	}
	private var ownedWinner:Bool;
	
	private function initVars():Void
	{
		services.getData().nextDay();
	}
	
	private var txt:TextField;
	
	private function initGraphics():Void 
	{
		var bg:Bitmap = new Bitmap(services.getArt().getByName("raceover_bg"));
		addChild(bg);
		
		txt = new TextField();
		txt.width = 900;
		addChild(txt);
		txt.x = 100;
		txt.y = 200;
		txt.text = "The winner of this race was "  + services.getData().getWinner().getName();
		
		checkWinnings();
	}
	
	private function checkWinnings():Void
	{
		var winner:Manatee = services.getData().getWinner();
		var owned:Array<Manatee> = services.getData().ownedManatees();
		if (owned.indexOf(winner) != -1) {
			txt.text += "\nThat's your manatee! you win $500";
			services.getData().spend(-500);
		}
		
		var winnerName:String = services.getData().getWinner().getName();
		var winningBet:Int = services.getData().getBets().get(winnerName);
		if (services.getData().getBets().exists(winnerName)) {
			txt.text += "\nYou bet $" + winningBet + 
				" on " + services.getData().getWinner().getName() + 
				" you get $" +  (winningBet * services.getData().getWinner().getOdds()) + " back";
			services.getData().spend( -winningBet * services.getData().getWinner().getOdds());
		} else {
			txt.text += "\nYou had no winning bet on this race";
		}
	}
	
	private function initEvents():Void 
	{
		addEventListener(MouseEvent.CLICK, handleClick);
	}
	
	private function handleClick(e:MouseEvent):Void 
	{
		super.callNewState(StateEnum.MENU);
	}
	
	//overrides
	override public function update():Void 
	{
		super.update();
	}
	
	override public function unload():Void 
	{
		super.unload();
		for (racer in services.getData().getRacers()) {
			racer.reset();
		}
		services.getData().clearRacers();
		services.getData().clearBets();
		removeEventListener(MouseEvent.CLICK, handleClick);
	}
	
	//accessors
}