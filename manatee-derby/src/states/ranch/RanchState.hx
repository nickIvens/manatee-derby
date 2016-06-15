package states.ranch;

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
class RanchState extends State
{

	public function new(srvcs:Services) 
	{
		super(srvcs);
		initVars();
		initGraphics();
		initEvents();
	}
	
	private var manatees:Array<Manatee>;
	private var selection:Int;
	
	private function initVars():Void
	{
		selection = 0;
		manatees = services.getData().ownedManatees();
	}
	
	private var buttonLeft:Sprite;
	private var buttonRight:Sprite;
	private var buttonFeed:Sprite;
	private var buttonTrain:Sprite;
	private var buttonSell:Sprite;
	private var buttonEnter:Sprite;
	private var buttonBack:Sprite;
	private var manateeImg:Sprite;
	private var manateeNameTxt:TextField;
	private var cashTxt:TextField;
	
	private function initGraphics():Void 
	{
		var bg:Bitmap = new Bitmap(services.getArt().getByName("ranch_bg"));
		addChild(bg);
		
		buttonBack = new Sprite();
		var btnBackImg:Bitmap = new Bitmap(services.getArt().getByName("btn_back"));
		buttonBack.addChild(btnBackImg);
		addChild(buttonBack);
		buttonBack.x = 765;
		buttonBack.y = 450;
		
		if (manatees.length > 0) {
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
			
			buttonFeed = new Sprite();
			var btnFeedImg:Bitmap = new Bitmap(services.getArt().getByName("btn_feed"));
			buttonFeed.addChild(btnFeedImg);
			addChild(buttonFeed);
			buttonFeed.x = 10;
			buttonFeed.y = 450;
			
			buttonTrain = new Sprite();
			var btnTrainImg:Bitmap = new Bitmap(services.getArt().getByName("btn_train"));
			buttonTrain.addChild(btnTrainImg);
			addChild(buttonTrain);
			buttonTrain.x = 200;
			buttonTrain.y = 450;
			
			buttonEnter = new Sprite();
			var btnEnterImg:Bitmap = new Bitmap(services.getArt().getByName("btn_enter"));
			buttonEnter.addChild(btnEnterImg);
			addChild(buttonEnter);
			buttonEnter.x = 390;
			buttonEnter.y = 450;
			
			buttonSell = new Sprite();
			var btnSellImg:Bitmap = new Bitmap(services.getArt().getByName("btn_sell"));
			buttonSell.addChild(btnSellImg);
			addChild(buttonSell);
			buttonSell.x = 570;
			buttonSell.y = 450;
			
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
		} else {
			var none:Bitmap = new Bitmap(services.getArt().getByName("no_manatees"));
			addChild(none);
			none.x = 100;
			none.y = 100;
		}
		
		cashTxt = new TextField();
		addChild(cashTxt);
		cashTxt.height = 30;
		cashTxt.x = 220;
		cashTxt.y = 420;
		cashTxt.text = "Cash: $" + services.getData().getCash();
	}
	
	private function refreshManatee():Void
	{
		var img:Bitmap = new Bitmap(services.getArt().getByName(manatees[selection].getImageName()));
		manateeImg.addChild(img);
		
		manateeNameTxt.text = manatees[selection].getName();
	}
	
	private function initEvents():Void 
	{
		if (manatees.length > 0) {
			buttonLeft.addEventListener(MouseEvent.CLICK, handleBtnLeft);
			buttonRight.addEventListener(MouseEvent.CLICK, handleBtnRight);
			buttonFeed.addEventListener(MouseEvent.CLICK, handleBtnFeed);
			buttonTrain.addEventListener(MouseEvent.CLICK, handleBtnTrain);
			buttonEnter.addEventListener(MouseEvent.CLICK, handleBtnEnter);
			buttonSell.addEventListener(MouseEvent.CLICK, handleBtnSell);
		}
		buttonBack.addEventListener(MouseEvent.CLICK, handleBtnBack);
	}
	
	private function handleBtnFeed(e:MouseEvent):Void 
	{
		if (services.getData().getCash() >= 50) {
			manatees[selection].feed();
			services.getData().spend(50);
			var confirm:ConfirmFeed = new ConfirmFeed(this, services);
			addChild(confirm);
			confirm.x = 100;
			confirm.y = 100;
		}
	}
	
	private function handleBtnTrain(e:MouseEvent):Void 
	{
		if (services.getData().getCash() >= 50) {
			manatees[selection].train();
			services.getData().spend(50);
			var confirm:ConfirmTrain = new ConfirmTrain(this, services);
			addChild(confirm);
			confirm.x = 100;
			confirm.y = 100;
		}
	}
	
	private var entering:Bool = false;
	
	private function handleBtnEnter(e:MouseEvent):Void 
	{
		if (!entering) {
			if (services.getData().getCash() >= 100) {
				var confirm:ConfirmEnter = new ConfirmEnter(this, services, manatees[selection]);
				addChild(confirm);
				confirm.x = 100;
				confirm.y = 100;
				entering = true;
			} else {
				var confirm:ConfirmNoMoney = new ConfirmNoMoney(this, services);
				addChild(confirm);
				confirm.x = 100;
				confirm.y = 100;
			}
		}
		
	}
	
	public function enterSelection():Void
	{
		services.getData().spend(100);
		services.getData().enterInRace(manatees[selection]);
	}
	
	public function resetEnter():Void
	{ 
		entering = false;
	}
	
	private var selling:Bool = false;
	
	private function handleBtnSell(e:MouseEvent):Void 
	{
		if(!selling){
			var confirm:ConfirmSell = new ConfirmSell(this, services, manatees[selection]);
			addChild(confirm);
			confirm.x = 100;
			confirm.y = 100;
			selling = true;
		}
	}
	
	public function resetSelling():Void
	{
		selling = false;
	}
	
	private function handleBtnLeft(e:MouseEvent):Void
	{
		if (selection > 0) selection--;
		refreshManatee();
	}
	
	private function handleBtnRight(e:MouseEvent):Void 
	{
		if (selection < manatees.length-1) selection++;
		refreshManatee();
	}
	
	private function handleBtnBack(e:MouseEvent):Void 
	{
		callNewState(StateEnum.MENU);
	}
	
	public function refresh():Void
	{
		callNewState(StateEnum.RANCH);
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