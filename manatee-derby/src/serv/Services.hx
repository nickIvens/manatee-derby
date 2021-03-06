package serv;

import openfl.display.Stage;
import openfl.Lib;

/**
 * @author Nick Ivens
 */

class Services
{
	private var artwork:Artwork;
	private var audio:Audio;
	private var data:Data;
	private var manatees:ManateePool;
	
	public function new(art:Artwork, aud:Audio, gamedata:Data, pool:ManateePool) 
	{
		artwork = art;
		manatees = pool;
		data = gamedata;
		audio = aud;
	}
	
	//accessors
	public function getArt():Artwork { return artwork; }
	public function getAudio():Audio { return audio; }
	public function getData():Data { return data; }
	public function getManatees():ManateePool { return manatees; }
}