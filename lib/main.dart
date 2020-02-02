import 'package:flutter/material.dart';
import 'app.dart';

class AppState {
  String className;
  List schedule;
  bool fetching;
  String error;

  AppState({this.className, this.schedule, this.fetching, this.error});

  AppState.fromPrevState(AppState prevState) {
    className = prevState.className;
    schedule = prevState.schedule;
    fetching = prevState.fetching;
    error = prevState.error;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // AppState initialState = await getInitialState();

  // final store = Store<AppState>(
  //   reducer,
  //   initialState: initialState,
  //   middleware: [thunkMiddleware, new LoggingMiddleware.printer()],
  // );
  // print(Platform.isMacOS);
  runApp(App());
}