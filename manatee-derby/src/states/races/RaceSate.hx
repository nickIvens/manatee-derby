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
		startBGMusic();
	}
	
	private var racers:Array<Manatee>;
	
	private function initVars():Void
	{
		racers = services.getData().getRacers();
	}
	
	private var racer1:Sprite;
	private var racer2:Sprite;
	private var racer3:Sprite;
	private var racer4:Sprite;
	
	private var swimImg:BitmapData;
	private var sleepImg:BitmapData;
	
	private function initGraphics():Void 
	{
		var bg:Bitmap = new Bitmap(services.getArt().getByName("races_bg"));
		addChild(bg);
		
		swimImg = services.getArt().getByName("manatee");
		sleepImg = services.getArt().getByName("manatee_slp");
		
		racer1 = new Sprite();
		racer1.addChild(new Bitmap(swimImg));
		addChild(racer1);
		racer1.y = 60;
		
		racer2 = new Sprite();
		racer2.addChild(new Bitmap(swimImg));
		addChild(racer2);
		racer2.y = 180;
		
		racer3 = new Sprite();
		racer3.addChild(new Bitmap(swimImg));
		addChild(racer3);
		racer3.y = 300;
		
		racer4 = new Sprite();
		racer4.addChild(new Bitmap(swimImg));
		addChild(racer4);
		racer4.y = 420;
	}
	
	private function initEvents():Void 
	{
		
	}

	private function startBGMusic():Void
	{
		services.getAudio().playSongByName("race_bg");
	}
	
	//overrides
	override public function update():Void 
	{
		super.update();
		for (racer in racers) {
			racer.update();
		}
		racer1.x = racers[0].distanceTravelled();
		if (racers[0].getState() == "SLEEP") {
			racer1.removeChildAt(0);
			racer1.addChild(new Bitmap(sleepImg));
		} else {
			racer1.removeChildAt(0);
			racer1.addChild(new Bitmap(swimImg));
		}
		
		racer2.x = racers[1].distanceTravelled();
		if (racers[1].getState() == "SLEEP") {
			racer2.removeChildAt(0);
			racer2.addChild(new Bitmap(sleepImg));
		} else {
			racer2.removeChildAt(0);
			racer2.addChild(new Bitmap(swimImg));
		}
		
		racer3.x = racers[2].distanceTravelled();
		if (racers[2].getState() == "SLEEP") {
			racer3.removeChildAt(0);
			racer3.addChild(new Bitmap(sleepImg));
		} else {
			racer3.removeChildAt(0);
			racer3.addChild(new Bitmap(swimImg));
		}
		
		racer4.x = racers[3].distanceTravelled();
		if (racers[3].getState() == "SLEEP") {
			racer4.removeChildAt(0);
			racer4.addChild(new Bitmap(sleepImg));
		} else {
			racer4.removeChildAt(0);
			racer4.addChild(new Bitmap(swimImg));
		}
		
		for (racer in racers) {
			if (racer.distanceTravelled() >= 960 - racer1.width) {
				services.getData().setWinner(racer);
				callNewState(StateEnum.RACE_OVER);
			};
		}
	}
	
	override public function unload():Void 
	{
		super.unload();
	}
	
	//accessors
	
}