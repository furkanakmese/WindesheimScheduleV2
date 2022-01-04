import '../store/actions.dart';
import '../main.dart';

AppState reducer(AppState state, action) {
  // what you would otherwise do with a spread operator, here you call a method you made that
  // populates a new state with the old data. Aferwards you update just the data that changed.
  AppState newState = AppState.fromPrevState(state);

  // switch (action.runtimeType) {
  //   case SetClassName:
  //     newState.className = action.className;
  //     newState.error = '';
  //     break;
  //   case GetScheduleFetching:
  //     newState.fetching = true;
  //     newState.error = '';
  //     break;
  //   case GetScheduleSucces:
  //     newState.schedule = action.schedule;
  //     newState.fetching = false;
  //     newState.error = '';
  //     break;
  //   case GetScheduleError:
  //     newState.error = action.error;
  //     newState.fetching = false;
  //     break;
  //   default:
  //     return state;
  // }

  // switch cases dont work with runtimetype for some reason..
  if (action.runtimeType == SetClassName) {
    newState.className = action.className;
    newState.error = '';
  } else if (action.runtimeType == GetScheduleFetching) {
    newState.fetching = true;
    newState.error = '';
  } else if (action.runtimeType == GetScheduleSucces) {
    newState.schedule = action.schedule;
    newState.fetching = false;
    newState.error = '';
  } else if (action.runtimeType == GetScheduleError) {
    newState.error = action.error;
    newState.fetching = false;
  }

  return newState;
}
