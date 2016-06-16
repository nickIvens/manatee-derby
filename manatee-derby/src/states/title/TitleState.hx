package states.title;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import serv.Services;
import states.State;

/**
 * @author Nick Ivens
 */

class TitleState extends State
{

	public function new(srvcs:Services) 
	{
		super(srvcs);
		initGraphics();
		initEvents();
		startBGMusic();
	}
	
	private function initGraphics():Void 
	{
		var bg:Bitmap = new Bitmap(services.getArt().getByName("title_bg"));
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
	
	private function startBGMusic():Void
	{
		services.getAudio().playSongByName("title_bg");
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