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
	
	private function initVars():Void
	{
		services.getData().nextDay();
	}
	
	private function initGraphics():Void 
	{
		var bg:Bitmap = new Bitmap(services.getArt().getByName("raceover_bg"));
		addChild(bg);
		var txt:TextField = new TextField();
		txt.width = 900;
		addChild(txt);
		txt.x = 100;
		txt.y = 200;
		txt.text = "The winner of this race was "  + services.getData().getWinner().getName();
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
		removeEventListener(MouseEvent.CLICK, handleClick);
	}
	
	//accessors
}