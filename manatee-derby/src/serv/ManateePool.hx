package serv;

/**
 * ...
 * @author Nick Ivens
 */
class ManateePool
{
	
	private var pool:Array<Manatee>;
	
	public function new() 
	{
		initVars();
	}
	
	private function initVars():Void 
	{
		pool = new Array<Manatee>();
		
		for (i in 0...10) {
			var m:Manatee = new Manatee("male");
			pool.push(m);
		}
		for (i in 0...10) {
			var m:Manatee = new Manatee("female");
			pool.push(m);
		}
		
	}
	
	public function moveToOwned(manatee:Manatee, ownedList:Array<Manatee>):Void
	{
		var index:Int = pool.indexOf(manatee);
		var tempManatee:Manatee = pool[index];
		
		ownedList.push(tempManatee);
		pool.splice(index, 1);
	}
	
	//accessors
	public function getManateeByIndex(i:Int):Manatee { return pool[i]; }
	public function count():Int { return pool.length; }
}