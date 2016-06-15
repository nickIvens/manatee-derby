package states;

import serv.Services;
import states.title.TitleState;

/**
 * @author Nick Ivens
 */

class StateFactory
{

	private var services:Services;
	
	public function new(srvcs:Services) 
	{
		services = srvcs;
	}
	
	public function getState(state:StateEnum):State
	{
		switch(state) {
		case TITLE:
			return new TitleState(services);
		}
	}
}