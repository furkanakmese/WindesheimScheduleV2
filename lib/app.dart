import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'main.dart';
import 'scenes/Home/home.dart';

class App extends StatelessWidget {
  final Store<AppState> store;
  App(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}
