package states;

import serv.Services;
import states.mart.MartState;
import states.menu.MenuState;
import states.placebet.PlaceBetState;
import states.racecard.RaceCardState;
import states.races.RaceSate;
import states.ranch.RanchState;
import states.title.TitleState;
import states.raceover.RaceOverState;

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
		case MENU:
			return new MenuState(services);
		case RANCH:
			return new RanchState(services);
		case MART:
			return new MartState(services);
		case RACE:
			return new RaceSate(services);
		case RACE_OVER:
			return new RaceOverState(services);
		case RACE_CARD:
			return new RaceCardState(services);
		case PLACE_BET:
			return new PlaceBetState(services);
		}
	}
}