package serv;

/**
 * ...
 * @author Nick Ivens
 */
class Data
{

	public function new() 
	{
		initVars();
	}
	
	private var cash:Int;
	private var day:Int;
	private var racers:Array<Int>;
	private var winner:Manatee;
	
	private function initVars():Void
	{
		cash = 1000;
		day = 1;
		racers = new Array<Int>();
		winner = new Manatee("male");
	}
	
	public function selectRacers():Void
	{
		racers = new Array<Int>();
		for (i in 0...4) {
			var number = Math.floor(Math.random() * 20);
			if (racers.indexOf(number) == -1) racers.push(number);
		}
	}
	
	public function nextDay():Void
	{
		day++;
	}
	
	//accessors
	public function getDay():Int { return day; }
	public function getCash():Int { return cash; }
	public function getRacers():Array<Int> { return racers; }
	public function getWinner():Manatee { return winner; }
	public function setWinner(win:Manatee):Void { winner = win; }
}