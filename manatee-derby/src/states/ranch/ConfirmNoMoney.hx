package states.ranch;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import serv.Services;

/**
 * ...
 * @author Nick Ivens
 */
class ConfirmNoMoney extends Sprite
{

	private var ranchState:RanchState;
	private var services:Services;
	
	public function new(parent:RanchState, srvcs:Services) 
	{
		super();
		ranchState = parent;
		services = srvcs;
		initGraphics();
	}
	
	private var buttonOk:Sprite;
	
	private function initGraphics():Void
	{
		var bg:Bitmap = new Bitmap(services.getArt().getByName("confirmnomoney_bg"));
		addChild(bg);
		
		buttonOk = new Sprite();
		var btnOkImg:Bitmap = new Bitmap(services.getArt().getByName("btn_ok"));
		buttonOk.addChild(btnOkImg);
		buttonOk.x = 50;
		buttonOk.y = 250;
		addChild(buttonOk);
		buttonOk.addEventListener(MouseEvent.CLICK, handleBtnOk);
	}
	
	private function handleBtnOk(e:MouseEvent):Void 
	{
		ranchState.refresh();
		parent.removeChild(this);
		buttonOk.removeEventListener(MouseEvent.CLICK, handleBtnOk);
	}
}