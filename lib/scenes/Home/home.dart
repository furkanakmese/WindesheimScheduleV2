import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../main.dart';
import '../../store/actions.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          children: <Widget>[
            StoreConnector<AppState, String>(
              converter: (store) => store.state.className,
              builder: (context, className) => Text(className),
            ),
            StoreConnector<AppState, VoidCallback>(
              converter: (store) {
                return () => store.dispatch(SetClassName('hey'));
              },
              builder: (context, callback) => FlatButton(
                child: Text('Update state'),
                onPressed: callback,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
