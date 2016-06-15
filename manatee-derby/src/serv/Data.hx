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
	private var owned:Array<Manatee>;
	private var winner:Manatee;
	
	private function initVars():Void
	{
		cash = 1000;
		day = 1;
		racers = new Array<Int>();
		owned = new Array<Manatee>();
		winner = new Manatee("male");
	}
	
	public function selectRacers(manateePoolLength:Int):Void
	{
		racers = new Array<Int>();
		while (racers.length < 4) {
			var number = Math.floor(Math.random() * manateePoolLength);
			if (racers.indexOf(number) == -1) racers.push(number);
		}
	}
	
	public function nextDay():Void
	{
		day++;
	}
	
	public function spend(amount:Int):Void
	{
		cash -= amount;
	}
	
	//accessors
	public function getDay():Int { return day; }
	public function getCash():Int { return cash; }
	public function getRacers():Array<Int> { return racers; }
	public function getWinner():Manatee { return winner; }
	public function setWinner(win:Manatee):Void { winner = win; }
	public function ownedManatees():Array<Manatee> { return owned; }
}