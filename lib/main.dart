import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'app.dart';
import 'store/reducer.dart';

class AppState {
  String className;
  List schedule;

  AppState({this.className, this.schedule});

  AppState.fromPrevState(AppState prevState) {
    className = prevState.className;
    schedule = prevState.schedule;
  }
}

final initialState = new AppState(className: 'Test', schedule: []);

void main() {
  final Store<AppState> store =
      Store<AppState>(reducer, initialState: initialState);
  runApp(App(store));
}
