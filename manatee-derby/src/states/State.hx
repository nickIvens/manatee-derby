package states;

import openfl.display.Sprite;
import openfl.events.Event;
import serv.Services;

/**
 * @author Nick Ivens
 */

class State extends Sprite
{
	private var services:Services;
	
	public function new(srvcs:Services) 
	{
		super();
		services = srvcs;
	}
	
	public function update():Void
	{
		/*
		 * Override this method in each subclass if its needed
		 */
	}
	
	public function unload():Void
	{
		/*
		 * Override this method to remove event listeners
		 */
	}
	
	private var newState:StateEnum;
	
	public function callNewState(state:StateEnum):Void
	{
		newState = state;
		dispatchEvent(new Event("NEW_STATE"));
	}
	
	//accessors
	public function getNewState():StateEnum
	{
		return newState;
	}
	
}