package src;

import lime.utils.DataView;
import openfl.display.Sprite;
import openfl.events.Event;
import serv.Artwork;
import serv.Audio;
import serv.Data;
import serv.ManateePool;
import serv.Services;
import states.StateManager;

/**
 * @author Nick Ivens
 */

class Game extends Sprite
{

	public function new() 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(e:Event = null):Void
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		var artwork:Artwork = new Artwork();
		var audio:Audio = new Audio();
		var data:Data = new Data();
		var manateePool = new ManateePool();
		var services:Services = new Services(artwork, audio, data, manateePool);
		
		var manager:StateManager = new StateManager(services);
		addEventListener(Event.ENTER_FRAME, manager.update);
		addChild(manager);
	}
	
}