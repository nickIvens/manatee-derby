package states;

import flash.events.Event;
import openfl.display.Sprite;
import serv.Services;

/**
 * @author Nick Ivens
 */

class StateManager extends Sprite
{

	private var services:Services;
	
	public function new(srvcs:Services) 
	{
		super();
		services = srvcs;
		init();
	}
	
	private var currentState:State;
	private var factory:StateFactory;
	
	private function init():Void
	{
		factory = new StateFactory(services);
		
		currentState = factory.getState(StateEnum.TITLE);
		currentState.addEventListener("NEW_STATE", swapState);
		addChild(currentState);
	}
	
	private function swapState(e:Event):Void 
	{
		var newState:StateEnum = currentState.getNewState();
		
		currentState.unload();
		currentState.removeEventListener("NEW_STATE", swapState);
		removeChild(currentState);
		
		currentState = factory.getState(newState);
		currentState.addEventListener("NEW_STATE", swapState);
		addChild(currentState);
	}
	
	public function update(e:Event = null):Void
	{
		currentState.update();
	}
	
}