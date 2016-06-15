package serv;

import openfl.display.Stage;
import openfl.Lib;

/**
 * @author Nick Ivens
 */

class Services
{
	private var artwork:Artwork;
	
	public function new(art:Artwork) 
	{
		artwork = art;
	}
	
	//accessors
	public function getArt():Artwork { return artwork; }
}