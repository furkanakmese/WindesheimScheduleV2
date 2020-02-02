import 'dart:convert';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

// sets the classname
class SetClassName {
  final String className;
  SetClassName(this.className);
}

// async action that fetches api data and dispatches succes event with data
ThunkAction<AppState> getSchedule = (Store<AppState> store) async {
  store.dispatch(GetScheduleFetching());
  http
      .get(
          'https://cors-anywhere.herokuapp.com/http://api.windesheim.nl/api/Klas/' +
              store.state.className +
              '/Les', headers: {'x-requested-with': 'origin'})
      .then((result) {
    if (json.decode(result.body) == null) {
      store.dispatch(GetScheduleError('No schedule found'));
    } else {
      store.dispatch(GetScheduleSucces(json.decode(result.body)));
    }
  }).catchError((error) {
    print(error.message);
    store.dispatch(GetScheduleError('Error while getting schedule'));
  });
};

class GetScheduleFetching {}

// succes event that gets processed by reducer
class GetScheduleSucces {
  final List schedule;
  GetScheduleSucces(this.schedule);
}

class GetScheduleError {
  final String error;
  GetScheduleError(this.error);
}
