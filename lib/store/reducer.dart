import 'package:windesheim_schedule_v2/main.dart';
import 'package:windesheim_schedule_v2/store/actions.dart';

AppState reducer(AppState state, action) {
  // what you would otherwise do with a spread operator, here you call a method you made that
  // populates a new state with the old data. Aferwards you update just the data that changed.
  AppState newState = AppState.fromPrevState(state);

  switch (action.runtimeType) {
    case SetClassName:
      newState.className = action.className;
      break;
    default:
      return state;
  }
  return newState;
}
