package states.placebet;

import openfl.display.Bitmap;
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
	}
	
	private function initVars():Void
	{
		
	}
	
	private function initGraphics():Void 
	{
		var bg:Bitmap = new Bitmap(services.getArt().getByName("placebet_bg"));
		addChild(bg);
		var txt:TextField = new TextField();
		txt.width = 900;
		addChild(txt);
		txt.x = 100;
		txt.y = 200;
		txt.text = "something";
	}
	
	private function initEvents():Void 
	{
		addEventListener(MouseEvent.CLICK, handleClick);
	}
	
	private function handleClick(e:MouseEvent):Void 
	{
		super.callNewState(StateEnum.RACE_CARD);
	}
	
	//overrides
	override public function update():Void 
	{
		super.update();
	}
	
	override public function unload():Void 
	{
		super.unload();
		removeEventListener(MouseEvent.CLICK, handleClick);
	}
	
	//accessors
}