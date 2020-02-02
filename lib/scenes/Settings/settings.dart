import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../main.dart';
import '../../utils/class.dart';
import '../../store/actions.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String className;

  void updateClassName(String newClass) {
    saveClassName(newClass);
  }

  @override
  Widget build(BuildContext context) {
    var controller;

    final snackBar = SnackBar(
      backgroundColor: Color.fromRGBO(0x10, 0x89, 0xFF, 1),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      content: Text('Updated class!'),
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: Colors.white,
        onPressed: () => Scaffold.of(context).hideCurrentSnackBar(),
      ),
    );

    return StoreConnector<AppState, VoidCallback>(
      converter: (store) => () {
        store.dispatch(SetClassName(controller.text));
        getSchedule(store);
      },
      builder: (context, callback) => Container(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: StoreConnector<AppState, String>(
            converter: (store) => store.state.className,
            builder: (context, className) {
              controller = TextEditingController(text: className);
              return Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Settings',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      height: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Class',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          TextField(
                            controller: controller,
                            onEditingComplete: () {
                              updateClassName(controller.text);
                              callback();
                              FocusScope.of(context).unfocus();
                              Scaffold.of(context).showSnackBar(snackBar);
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter class',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
