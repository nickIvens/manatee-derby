package states.title;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.media.Sound;
import openfl.media.SoundChannel;
import openfl.media.SoundTransform;
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
	
	private var bgMusic:Sound;
	
	private function startBGMusic():Void
	{
		bgMusic = services.getAudio().getByName("title_bg");
		bgMusic.play();
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
		bgMusic.close();
	}
	
	//accessors
}