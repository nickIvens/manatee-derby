package states.races;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import serv.Data;
import serv.Services;
import states.State;

/**
 * ...
 * @author Nick Ivens
 */
class RaceSate extends State
{

	public function new(srvcs:Services) 
	{
		super(srvcs);
		initVars();
		initGraphics();
		initEvents();
	}
	
	private var racers:Array<Int>;
	
	private function initVars():Void
	{
		racers = services.getData().getRacers();
	}
	
	private var racer1:Sprite;
	private var racer2:Sprite;
	private var racer3:Sprite;
	private var racer4:Sprite;
	
	private function initGraphics():Void 
	{
		var bg:Bitmap = new Bitmap(services.getArt().getByName("races_bg"));
		addChild(bg);
		
		var racerImg:Bitmap = new Bitmap(services.getArt().getByName("manatee"));
		racer1 = new Sprite();
		racer1.addChild(racerImg);
		addChild(racer1);
		racer1.y = 60;
		
		racerImg = new Bitmap(services.getArt().getByName("manatee"));
		racer2 = new Sprite();
		racer2.addChild(racerImg);
		addChild(racer2);
		racer2.y = 180;
		
		racerImg = new Bitmap(services.getArt().getByName("manatee"));
		racer3 = new Sprite();
		racer3.addChild(racerImg);
		addChild(racer3);
		racer3.y = 300;
		
		racerImg = new Bitmap(services.getArt().getByName("manatee"));
		racer4 = new Sprite();
		racer4.addChild(racerImg);
		addChild(racer4);
		racer4.y = 420;
	}
	
	private function initEvents():Void 
	{
		
	}
	
	//overrides
	override public function update():Void 
	{
		super.update();
		for (racer in racers) {
			services.getManatees().getManateeByIndex(racer).update();
		}
		racer1.x = services.getManatees().getManateeByIndex(racers[0]).distanceTravelled();
		racer2.x = services.getManatees().getManateeByIndex(racers[1]).distanceTravelled();
		racer3.x = services.getManatees().getManateeByIndex(racers[2]).distanceTravelled();
		racer4.x = services.getManatees().getManateeByIndex(racers[3]).distanceTravelled();
		
		for (racer in racers) {
			if (services.getManatees().getManateeByIndex(racer).distanceTravelled() >= 960 - racer1.width) {
				services.getData().setWinner(services.getManatees().getManateeByIndex(racer));
				callNewState(StateEnum.RACE_OVER);
			};
		}
	}
	
	override public function unload():Void 
	{
		super.unload();
		for (i in racers) {
			services.getManatees().getManateeByIndex(i).reset();
		}
	}
	
	//accessors
	
}