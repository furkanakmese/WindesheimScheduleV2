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
  runApp(App());
}