package states.ranch;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import serv.Services;

/**
 * ...
 * @author Nick Ivens
 */
class ConfirmSell extends Sprite
{

	private var ranchState:RanchState;
	private var services:Services;
	private var manatee:Manatee;
	
	public function new(parent:RanchState, srvcs:Services, manatee:Manatee) 
	{
		super();
		ranchState = parent;
		services = srvcs;
		this.manatee = manatee;
		initGraphics();
	}
	
	private var buttonYes:Sprite;
	private var buttonNo:Sprite;
	private var buttonBack:Sprite;
	
	private function initGraphics():Void
	{
		var bg:Bitmap = new Bitmap(services.getArt().getByName("confirm_bg"));
		addChild(bg);
		
		var txt:TextField = new TextField();
		txt.y = 100;
		txt.width = 750;
		txt.text = "Are you sure you want to sell " + manatee.getName() + "?";
		addChild(txt);
		
		buttonYes = new Sprite();
		var btnYesImg:Bitmap = new Bitmap(services.getArt().getByName("btn_yes"));
		buttonYes.addChild(btnYesImg);
		buttonYes.x = 50;
		buttonYes.y = 250;
		addChild(buttonYes);
		buttonYes.addEventListener(MouseEvent.CLICK, handleBtnYes);
		
		buttonNo = new Sprite();
		var btnNoImg:Bitmap = new Bitmap(services.getArt().getByName("btn_no"));
		buttonNo.addChild(btnNoImg);
		buttonNo.x = 350;
		buttonNo.y = 250;
		addChild(buttonNo);
		buttonNo.addEventListener(MouseEvent.CLICK, handleBtnNo);

	}
	
	private function handleBtnYes(e:MouseEvent):Void 
	{
		services.getData().spend(-500);
		services.getManatees().moveToPool(manatee, services.getData().ownedManatees());
		ranchState.refresh();
		ranchState.resetSelling();
		parent.removeChild(this);
		buttonYes.removeEventListener(MouseEvent.CLICK, handleBtnYes);
	}
	
	private function handleBtnNo(e:MouseEvent):Void 
	{
		ranchState.resetSelling();
		parent.removeChild(this);
		buttonNo.removeEventListener(MouseEvent.CLICK, handleBtnNo);
	}
	
}