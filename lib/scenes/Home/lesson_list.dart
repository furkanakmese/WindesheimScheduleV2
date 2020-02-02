import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:windesheim_schedule_v2/utils/schedule.dart';

import '../../main.dart';
import 'list_item.dart';

class LessonList extends StatefulWidget {
  final SwiperController controller;
  LessonList(this.controller);

  @override
  _LessonListState createState() => _LessonListState();
}

class _LessonListState extends State<LessonList> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        if (!state.fetching) {
          if (state.error != '') {
            return Container(
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/svg/undraw_server_down_s4lk.svg',
                    height: 130,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      state.error,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              // padding: EdgeInsets.only(left: 10, right: 10),
              height: 400,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  var items = getLessons(
                    state.schedule,
                    formatDate(
                        DateTime.now().toUtc().add(new Duration(days: index)),
                        [yyyy, '-', mm, '-', dd, 'T00:00:00Z']).toString(),
                  );
                  if (items != null) {
                    if (items.length > 0) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                            child: Text(
                              formatDate(
                                DateTime.now()
                                    .toUtc()
                                    .add(new Duration(days: index)),
                                [DD, ' ', d, ' ', MM],
                              ),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Column(
                            children: items
                                .map((item) =>
                                    ListItem(item, items.indexOf(item)))
                                .toList(),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 0, 50),
                            child: Text(
                              formatDate(
                                DateTime.now()
                                    .toUtc()
                                    .add(new Duration(days: index)),
                                [DD, ' ', d, ' ', MM],
                              ),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Center(
                            child: Column(
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/svg/undraw_no_data_qbuo.svg',
                                  height: 160,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    'No lessons today',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  } else {
                    return Text('Items was null');
                  }
                },
                itemCount: state.schedule != null ? state.schedule.length : 0,
                controller: widget.controller,
                onTap: (data) => widget.controller.next(animation: true),
                viewportFraction: 1,
                scale: 1,
                loop: false,
                duration: 200,
              ),
            );
          }
        } else {
          return Container(
            height: 400,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
