package states.menu;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import serv.Services;
import states.State;

/**
 * @author Nick Ivens
 */

class MenuState extends State
{

	public function new(srvcs:Services) 
	{
		super(srvcs);
		initGraphics();
		initEvents();
	}
	
	private var buttonRanch:Sprite;
	private var buttonMart:Sprite;
	private var buttonRaces:Sprite;
	
	private function initGraphics():Void 
	{
		var bg:Bitmap = new Bitmap(services.getArt().getByName("menu_bg"));
		addChild(bg);
		
		buttonRanch = new Sprite();
		var btnImg:Bitmap = new Bitmap(services.getArt().getByName("btn_ranch"));
		buttonRanch.addChild(btnImg);
		addChild(buttonRanch);
		
		buttonMart = new Sprite();
		btnImg = new Bitmap(services.getArt().getByName("btn_mart"));
		buttonMart.addChild(btnImg);
		addChild(buttonMart);
		buttonMart.x = 320;
		
		buttonRaces = new Sprite();
		var btnImg = new Bitmap(services.getArt().getByName("btn_races"));
		buttonRaces.addChild(btnImg);
		addChild(buttonRaces);
		buttonRaces.x = 640;
		
		var txt:TextField = new TextField();
		addChild(txt);
		txt.x = 50;
		txt.y = 520;
		txt.width = 900;
		txt.text = "Day: " + services.getData().getDay() + " Cash: $" + services.getData().getCash();
	}
	
	private function initEvents():Void 
	{
		buttonRanch.addEventListener(MouseEvent.CLICK, handleBtnRanch);
		buttonMart.addEventListener(MouseEvent.CLICK, handleBtnMart);
		buttonRaces.addEventListener(MouseEvent.CLICK, handleBtnRaces);
	}
	
	private function handleBtnMart(e:MouseEvent):Void 
	{
		super.callNewState(StateEnum.MART);
	}
	
	private function handleBtnRanch(e:MouseEvent):Void 
	{
		super.callNewState(StateEnum.RANCH);
	}
	
	private function handleBtnRaces(e:MouseEvent):Void 
	{
		services.getData().selectRacers(services.getManatees().manateePool());
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
		buttonRanch.removeEventListener(MouseEvent.CLICK, handleBtnRanch);
		buttonMart.removeEventListener(MouseEvent.CLICK, handleBtnMart);
		buttonRaces.removeEventListener(MouseEvent.CLICK, handleBtnRaces);
	}
	
	//accessors
}