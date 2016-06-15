package states.ranch;

import openfl.display.Bitmap;
import openfl.events.MouseEvent;
import serv.Services;
import states.State;

/**
 * ...
 * @author Nick Ivens
 */
class RanchState extends State
{

	public function new(srvcs:Services) 
	{
		super(srvcs);
		initGraphics();
		initEvents();
	}
	
	private function initGraphics():Void 
	{
		var bg:Bitmap = new Bitmap(services.getArt().getByName("ranch_bg"));
		addChild(bg);
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