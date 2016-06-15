package;

import openfl.display.Sprite;
import src.Game;

/**
 * @author Nick Ivens
 */

class Main extends Sprite 
{

	public function new() 
	{
		super();
		init();
	}
	
	private function init(): Void
	{
		var game:Game = new Game();
		addChild(game);
	}

}
