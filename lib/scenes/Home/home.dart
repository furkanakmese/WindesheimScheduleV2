import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../store/actions.dart';
import '../../main.dart';
import 'header.dart';
import 'header_web.dart';
import 'lesson_list.dart';
import 'lesson_list_web.dart';

class Home extends StatelessWidget {
  final SwiperController controller;
  Home(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StoreConnector<AppState, _ViewModel>(
        converter: (store) => _ViewModel.fromStore(store),
        builder: (context, viewModel) => Container(
          // padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: RefreshIndicator(
            child: ListView(
              children: <Widget>[
                (kIsWeb ? HeaderWeb(controller) : Header(controller)),
                (kIsWeb ? LessonListWeb(controller) : LessonList(controller)),
              ],
            ),
            onRefresh: viewModel.dispatchGetSchedule,
          ),
        ),
      ),
    );
  }
}

class _ViewModel {
  final VoidCallback dispatchGetSchedule;

  _ViewModel({@required this.dispatchGetSchedule});

  static _ViewModel fromStore(store) {
    return _ViewModel(
      dispatchGetSchedule: () async {
        await store.dispatch(getSchedule(store));
        Completer<Null> completer = new Completer<Null>();
        completer.complete();
      },
    );
  }
}
