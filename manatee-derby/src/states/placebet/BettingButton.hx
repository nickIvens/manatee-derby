package states.placebet;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import serv.Services;

/**
 * ...
 * @author Nick Ivens
 */
class BettingButton extends Sprite
{
	private var placeBetState:PlaceBetState;
	private var services:Services;
	private var manateeName:String;
	private var oddsToWin:Int;
	
	public function new(parent:PlaceBetState, srvcs:Services, name:String, odds:Int) 
	{
		super();
		placeBetState = parent;
		services = srvcs;
		manateeName = name;
		oddsToWin = odds;
		initGraphics();
		initEvents();
	}
	
	private var bet10:Sprite;
	private var bet50:Sprite;
	private var bet100:Sprite;
	
	private function initGraphics():Void
	{
		var txt:TextField = new TextField();
		txt.text = manateeName + " @ " + oddsToWin + "/1";
		
		if (services.getData().getBets().exists(manateeName)) {
		txt.text += "\n You have $"	+ services.getData().getBets().get(manateeName) + " on this manatee";
		}
		
		addChild(txt);
		txt.width = 300;
		
		bet10 = new Sprite();
		var bet10Img:Bitmap = new Bitmap(services.getArt().getByName("bet10_btn"));
		bet10.addChild(bet10Img);
		addChild(bet10);
		bet10.x = 300;
		
		bet50 = new Sprite();
		var bet50Img:Bitmap = new Bitmap(services.getArt().getByName("bet50_btn"));
		bet50.addChild(bet50Img);
		addChild(bet50);
		bet50.x = 370;
		
		bet100 = new Sprite();
		var bet100Img:Bitmap = new Bitmap(services.getArt().getByName("bet100_btn"));
		bet100.addChild(bet100Img);
		addChild(bet100);
		bet100.x = 440;
	}
	
	public function initEvents():Void
	{
		bet10.addEventListener(MouseEvent.CLICK, handleBtn10);
		bet50.addEventListener(MouseEvent.CLICK, handleBtn50);
		bet100.addEventListener(MouseEvent.CLICK, handleBtn100);
	}
	
	private function handleBtn10(e:MouseEvent):Void 
	{
		if(services.getData().getCash() >= 10) placeBetState.createBet(manateeName, 10);
	}
	
	private function handleBtn50(e:MouseEvent):Void 
	{
		if(services.getData().getCash() >= 50) placeBetState.createBet(manateeName, 50);
	}
	
	private function handleBtn100(e:MouseEvent):Void 
	{
		if(services.getData().getCash() >= 100) placeBetState.createBet(manateeName, 100);
	}
	
}