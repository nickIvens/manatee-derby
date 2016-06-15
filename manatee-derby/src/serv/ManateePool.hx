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
		
		for (i in 0...9) {
			var m:Manatee = new Manatee("male");
			pool.push(m);
		}
		for (i in 0...9) {
			var m:Manatee = new Manatee("female");
			pool.push(m);
		}
		
	}
	
	//accessors
	public function getManateeByIndex(i:Int):Manatee
	{
		return pool[i];
	}
}