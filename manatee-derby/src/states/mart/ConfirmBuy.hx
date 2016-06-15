package states.mart;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import serv.Services;

/**
 * ...
 * @author Nick Ivens
 */
class ConfirmBuy extends Sprite
{
	private var martState:MartState;
	private var services:Services;
	private var manatee:Manatee;
	
	public function new(parent:MartState, srvcs:Services, manateeIndex) 
	{
		super();
		martState = parent;
		services = srvcs;
		manatee = services.getManatees().getManateeByIndex(manateeIndex);
		initGraphics();
	}
	
	private var buttonYes:Sprite;
	private var buttonNo:Sprite;
	private var buttonBack:Sprite;
	
	private function initGraphics():Void
	{
		var bg:Bitmap = new Bitmap(services.getArt().getByName("confirmbuy_bg"));
		addChild(bg);
		
		var txt:TextField = new TextField();
		txt.y = 100;
		txt.width = 750;
		
		if (services.getData().getCash() < 500) {
			txt.text = "You cannot afford a new manatee";
			
			buttonBack = new Sprite();
			var btnImg:Bitmap = new Bitmap(services.getArt().getByName("btn_back"));
			buttonBack.addChild(btnImg);
			buttonBack.x = 250;
			buttonBack.y = 250;
			addChild(buttonBack);
			buttonBack.addEventListener(MouseEvent.CLICK, handleBtnBack);
			
		} else {
			txt.text = "Are you sure you want to buy " + manatee.getName() + "?";
			
			buttonYes = new Sprite();
			var btnYesImg:Bitmap = new Bitmap(services.getArt().getByName("btn_back"));
			buttonYes.addChild(btnYesImg);
			buttonYes.x = 50;
			buttonYes.y = 250;
			addChild(buttonYes);
			buttonYes.addEventListener(MouseEvent.CLICK, handleBtnYes);
			
			buttonNo = new Sprite();
			var btnNoImg:Bitmap = new Bitmap(services.getArt().getByName("btn_back"));
			buttonNo.addChild(btnNoImg);
			buttonNo.x = 350;
			buttonNo.y = 250;
			addChild(buttonNo);
			buttonNo.addEventListener(MouseEvent.CLICK, handleBtnNo);
		}
		addChild(txt);
	}
	
	private function handleBtnBack(e:MouseEvent):Void 
	{
		parent.removeChild(this);
		buttonBack.removeEventListener(MouseEvent.CLICK, handleBtnBack);
	}
	
	private function handleBtnYes(e:MouseEvent):Void 
	{
		services.getData().spend(500);
		services.getManatees().moveToOwned(manatee, services.getData().ownedManatees());
		martState.refreshLineUp();
		parent.removeChild(this);
		buttonYes.removeEventListener(MouseEvent.CLICK, handleBtnYes);
	}
	
	private function handleBtnNo(e:MouseEvent):Void 
	{
		parent.removeChild(this);
		buttonNo.removeEventListener(MouseEvent.CLICK, handleBtnNo);
	}
}