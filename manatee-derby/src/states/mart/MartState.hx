package states.mart;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import serv.Services;
import states.State;

/**
 * ...
 * @author Nick Ivens
 */

class MartState extends State
{

	public function new(srvcs:Services) 
	{
		super(srvcs);
		initVars();
		initGraphics();
		initEvents();
	}
	
	private var forSale:Array<Int>;
	private var selection:Int;
	
	private function initVars():Void
	{
		selection = 0;
		forSale = new Array<Int>();
		while (forSale.length < 3) {
			var number = Math.floor(Math.random() * services.getManatees().count());
			if (forSale.indexOf(number) == -1) forSale.push(number);
		}
	}
	
	private var buttonLeft:Sprite;
	private var buttonRight:Sprite;
	private var buttonBuy:Sprite;
	private var buttonBack:Sprite;
	private var manateeImg:Sprite;
	private var manateeNameTxt:TextField;
	private var cashTxt:TextField;
	
	private function initGraphics():Void 
	{
		var bg:Bitmap = new Bitmap(services.getArt().getByName("mart_bg"));
		addChild(bg);
		
		buttonLeft = new Sprite();
		var btnLeftImg:Bitmap = new Bitmap(services.getArt().getByName("arrowL"));
		buttonLeft.addChild(btnLeftImg);
		addChild(buttonLeft);
		buttonLeft.x = 50;
		buttonLeft.y = 100;
		
		buttonRight = new Sprite();
		var btnRightImg:Bitmap = new Bitmap(services.getArt().getByName("arrowR"));
		buttonRight.addChild(btnRightImg);
		addChild(buttonRight);
		buttonRight.x = 810;
		buttonRight.y = 100;
		
		buttonBuy = new Sprite();
		var btnBuyImg:Bitmap = new Bitmap(services.getArt().getByName("btn_buy"));
		buttonBuy.addChild(btnBuyImg);
		addChild(buttonBuy);
		buttonBuy.x = 250;
		buttonBuy.y = 450;
		
		buttonBack = new Sprite();
		var btnBackImg:Bitmap = new Bitmap(services.getArt().getByName("btn_back"));
		buttonBack.addChild(btnBackImg);
		addChild(buttonBack);
		buttonBack.x = 550;
		buttonBack.y = 450;
		
		manateeImg  = new Sprite();
		addChild(manateeImg);
		manateeImg.x = 355;
		manateeImg.y = 150;
		
		manateeNameTxt = new TextField();
		manateeNameTxt.width = 600;
		manateeNameTxt.x = 200;
		manateeNameTxt.y = 120;
		addChild(manateeNameTxt);
		
		refreshManatee();
		
		cashTxt = new TextField();
		addChild(cashTxt);
		cashTxt.height = 30;
		cashTxt.x = 220;
		cashTxt.y = 420;
		cashTxt.text = "Cash: $" + services.getData().getCash();
	}
	
	private function refreshManatee():Void
	{
		var img:Bitmap = new Bitmap(services.getArt().getByName(services.getManatees().getManateeByIndex(forSale[selection]).getImageName()));
		manateeImg.addChild(img);
		
		manateeNameTxt.text = services.getManatees().getManateeByIndex(forSale[selection]).getName();
	}
	
	private function initEvents():Void 
	{
		buttonLeft.addEventListener(MouseEvent.CLICK, handleBtnLeft);
		buttonRight.addEventListener(MouseEvent.CLICK, handleBtnRight);
		buttonBuy.addEventListener(MouseEvent.CLICK, handleBtnBuy);
		buttonBack.addEventListener(MouseEvent.CLICK, handleBtnBack);
	}
	
	private function handleBtnLeft(e:MouseEvent):Void
	{
		if (selection > 0) selection--;
		refreshManatee();
	}
	
	private function handleBtnRight(e:MouseEvent):Void 
	{
		if (selection < forSale.length-1) selection++;
		refreshManatee();
	}
	
	private var buying:Bool = false;
	
	private function handleBtnBuy(e:MouseEvent):Void 
	{
		if(!buying){
			var confirm:ConfirmBuy = new ConfirmBuy(this, services, forSale[selection]);
			addChild(confirm);
			confirm.x = 100;
			confirm.y = 100;
			buying = true;
		}
	}
	
	public function resetBuying():Void
	{
		buying =  false;
	}
	
	private function handleBtnBack(e:MouseEvent):Void 
	{
		callNewState(StateEnum.MENU);
	}
	
	public function refreshLineUp():Void
	{
		cashTxt.text = "Cash: $" + services.getData().getCash();
		forSale.splice(selection, 1);
		selection = 0;
		refreshManatee();
	}
	
	//overrides
	override public function update():Void 
	{
		super.update();
	}
	
	override public function unload():Void 
	{
		super.unload();
	}
	
	//accessors
	
}