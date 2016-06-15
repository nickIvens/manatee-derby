package;

/**
 * ...
 * @author Nick Ivens
 */
class Manatee
{
	
	private var gender:String;
	private var clss:Int;

	public function new(gndr:String) 
	{
		gender = gndr;
		initVars();
	}
	
	private var maleNames:Array<String> = ["Ned", "Clive", "Fins", "Wet Bob", "Dave", "Cuthbert", "Fred", "Maximillian", "Reginald"];
	private var femaleNames:Array<String> = ["Mel", "Anna", "Marina", "Ariel", "Sandy", "Sarah", "Judy", "Martha", "Cutie Pie", "Hannah"];
	private var surNames:Array<String> = ["Stark", "Jones", "Waterman", "Seaworth", "Styles", "Olsen", "Kent", "the Rocket", "McGee"];
	
	private var name:String;
	private var rating:Int;
	private var imageName:String;
	private var masterStamina:Int;
	private var currentStamina:Int;
	private var masterSleepiness:Int;
	private var currentSleepiness:Int;
	private var distTravelled:Float;
	
	private function initVars():Void
	{
		if (gender == "male") name = maleNames[Math.floor(Math.random() * (maleNames.length))];
		if (gender == "female") name = femaleNames[Math.floor(Math.random() * (femaleNames.length))];
		name = name + " " + surNames[Math.floor(Math.random() * (surNames.length))];
		
		imageName = "manatee" + Math.floor(Math.random() * 6 + 1);
		
		masterStamina = Math.floor(Math.random() * 120 + 120);
		masterSleepiness = Math.floor(Math.random() * 120 + 120);
		rating = masterStamina - masterSleepiness;
		currentStamina = newStamina();
		currentSleepiness = newSleepiness();
		
		distTravelled = 0;
	}
	
	private function newStamina():Int
	{
		return Math.floor(Math.random() * 120 + (masterStamina - 60));
	}
	
	private function newSleepiness():Int
	{
		return Math.floor(Math.random() * 120 + (masterSleepiness));
	}
	
	public function update():Void
	{
		if (currentStamina > 0 ) {
			distTravelled++;
			currentStamina--;
		}
		if (currentStamina == 0) {
			currentSleepiness--;
		}
		if (currentSleepiness == 0) {
			currentStamina = newStamina();
			currentSleepiness = newSleepiness();
		}
	}
	
	public function reset():Void
	{
		distTravelled = 0;
	}
	
	public function feed():Void
	{
		masterSleepiness += 5;
	}
	
	public function train():Void
	{
		masterStamina += 5;
	}
	
	//accessors
	public function distanceTravelled():Float { return distTravelled; }
	public function getName():String { return name; }
	public function getImageName():String { return imageName; }
	public function getRating():Int { return rating; }
}