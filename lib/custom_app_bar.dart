// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'main.dart';
import 'store/actions.dart';
import 'utils/class.dart';

class CustomAppBar extends StatefulWidget {
  final SwiperController controller;
  CustomAppBar(this.controller);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  String className;
  final FocusNode focusNode = FocusNode();

  void updateClassName(String newClass) {
    saveClassName(newClass);
  }

  @override
  Widget build(BuildContext context) {
    var textController;

    final snackBar = SnackBar(
      backgroundColor: Color.fromRGBO(0x10, 0x89, 0xFF, 1),
      duration: Duration(seconds: 2),
      elevation: 2,
      behavior: SnackBarBehavior.floating,
      content: Text('Updated class!'),
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: Colors.white,
        onPressed: () => Scaffold.of(context).hideCurrentSnackBar(),
      ),
    );

    if (kIsWeb) {
      return AppBar(
        backgroundColor: Color.fromRGBO(0x82, 0x93, 0xFF, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Windesheim schedule'),
            StoreConnector<AppState, VoidCallback>(
              converter: (store) => () {
                store.dispatch(SetClassName(textController.text));
                getSchedule(store);
              },
              builder: (context, callback) => Container(
                margin: EdgeInsets.only(left: 100),
                child: StoreConnector<AppState, String>(
                  converter: (store) => store.state.className,
                  builder: (context, className) {
                    textController = TextEditingController(text: className);
                    return Row(
                      children: <Widget>[
                        Container(
                          width: 120,
                          height: 30,
                          padding: EdgeInsets.only(right: 5),
                          alignment: Alignment.center,
                          child: TextField(
                            controller: textController,
                            focusNode: focusNode,
                            onSubmitted: (data) {
                              updateClassName(textController.text);
                              callback();
                              FocusScope.of(context).unfocus();
                              Scaffold.of(context).showSnackBar(snackBar);
                            },
                            // textAlignVertical: TextAlignVertical.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 16),
                            decoration: InputDecoration(
                              hintText: 'Class',
                              hintStyle: TextStyle(color: Colors.white54),
                              contentPadding: EdgeInsets.only(bottom: 12),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.5),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.5),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          child: RaisedButton(
                            child: Text('Set class'),
                            onPressed: () {
                              updateClassName(textController.text);
                              callback();
                              FocusScope.of(context).unfocus();
                              Scaffold.of(context).showSnackBar(snackBar);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Container(
            height: 30,
            alignment: Alignment.center,
            child: Text(
              'Download the Android app',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: Colors.white,
                  ),
                  onPressed: () => widget.controller.previous(),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    size: 25,
                    color: Colors.white,
                  ),
                  onPressed: () => widget.controller.next(),
                )
              ],
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
