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
	private var racers:Array<Manatee>;
	private var owned:Array<Manatee>;
	private var winner:Manatee;
	
	private function initVars():Void
	{
		cash = 1000;
		day = 1;
		racers = new Array<Manatee>();
		owned = new Array<Manatee>();
		winner = new Manatee("male");
	}
	
	public function clearRacers():Void
	{
		racers = new Array<Manatee>();
	}
	public function selectRacers(pool:Array<Manatee>):Void
	{
		while (racers.length < 4) {
			var number = Math.floor(Math.random() * pool.length);
			if (racers.indexOf(pool[number]) == -1) racers.push(pool[number]);
		}
	}
	
	public function enterInRace(manatee:Manatee):Void
	{
		if(racers.length < 4){
			racers.push(manatee);
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
	public function getRacers():Array<Manatee> { return racers; }
	public function getWinner():Manatee { return winner; }
	public function setWinner(win:Manatee):Void { winner = win; }
	public function ownedManatees():Array<Manatee> { return owned; }
}