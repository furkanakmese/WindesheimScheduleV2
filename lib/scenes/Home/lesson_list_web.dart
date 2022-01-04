import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../utils/schedule.dart';
import '../../main.dart';
import 'list_item_web.dart';

class LessonListWeb extends StatelessWidget {
  final SwiperController controller;
  LessonListWeb(this.controller);

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
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      state.error,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container(
              height: MediaQuery.of(context).size.height * 0.80,
              color: Colors.white,
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.all(20),// EdgeInsets.only(top: 20, bottom: 20),
                width: MediaQuery.of(context).size.width > 1000 ? 1000 : null,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    var items = getLessons(
                      state.schedule,
                      formatDate(
                          DateTime.now().toUtc().add(new Duration(days: index)),
                          [yyyy, '-', mm, '-', dd, 'T00:00:00Z']).toString(),
                    );
                    return Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.80,
                            // width: MediaQuery.of(context).size.width * 1.0,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    formatDate(
                                        getCorrectDate(
                                            DateTime.now().toUtc().add(
                                                new Duration(days: index * 7)),
                                            DateTime.monday),
                                        [DD, ' ', MM, ' ', dd]),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: getDayLessons(
                                    state.schedule,
                                    DateTime.monday,
                                    DateTime.now()
                                        .toUtc()
                                        .add(new Duration(days: index * 7)),
                                  )
                                      .asMap().entries.map((item) => ListItemWeb(
                                          item.value, item.key + 10 + index))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.80,
                          color: Colors.white,
                          child: VerticalDivider(),
                        ),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.80,
                            // width: MediaQuery.of(context).size.width * 0.20,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    formatDate(
                                        getCorrectDate(
                                            DateTime.now().toUtc().add(
                                                new Duration(days: index * 7)),
                                            DateTime.tuesday),
                                        [DD, ' ', MM, ' ', dd]),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: getDayLessons(
                                    state.schedule,
                                    DateTime.tuesday,
                                    DateTime.now()
                                        .toUtc()
                                        .add(new Duration(days: index * 7)),
                                  )
                                      .asMap().entries.map((item) => ListItemWeb(
                                          item.value, item.key + 20 + index))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.80,
                          color: Colors.white,
                          child: VerticalDivider(),
                        ),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.80,
                            // width: MediaQuery.of(context).size.width * 0.20,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    formatDate(
                                        getCorrectDate(
                                            DateTime.now().toUtc().add(
                                                new Duration(days: index * 7)),
                                            DateTime.wednesday),
                                        [DD, ' ', MM, ' ', dd]),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: getDayLessons(
                                    state.schedule,
                                    DateTime.wednesday,
                                    DateTime.now()
                                        .toUtc()
                                        .add(new Duration(days: index * 7)),
                                  )
                                      .asMap().entries.map((item) => ListItemWeb(
                                          item.value, item.key + 30 + index))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.80,
                          color: Colors.white,
                          child: VerticalDivider(),
                        ),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.80,
                            // width: MediaQuery.of(context).size.width * 0.20,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    formatDate(
                                        getCorrectDate(
                                            DateTime.now().toUtc().add(
                                                new Duration(days: index * 7)),
                                            DateTime.thursday),
                                        [DD, ' ', MM, ' ', dd]),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: getDayLessons(
                                    state.schedule,
                                    DateTime.thursday,
                                    DateTime.now()
                                        .toUtc()
                                        .add(new Duration(days: index * 7)),
                                  )
                                      .asMap().entries.map((item) => ListItemWeb(
                                          item.value, item.key + 40 + index))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.80,
                          color: Colors.white,
                          child: VerticalDivider(),
                        ),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.80,
                            // width: MediaQuery.of(context).size.width * 0.20,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    formatDate(
                                        getCorrectDate(
                                            DateTime.now().toUtc().add(
                                                new Duration(days: index * 7)),
                                            DateTime.friday),
                                        [DD, ' ', MM, ' ', dd]),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: getDayLessons(
                                    state.schedule,
                                    DateTime.friday,
                                    DateTime.now()
                                        .toUtc()
                                        .add(new Duration(days: index * 7)),
                                  )
                                      .asMap().entries.map((item) => ListItemWeb(
                                          item.value, item.key + 50 + index))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: state.schedule != null ? state.schedule.length : 0,
                  controller: controller,
                  // onTap: (data) => controller.next(animation: true),
                  viewportFraction: 1,
                  scale: 1,
                  loop: false,
                  duration: 200,
                ),
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
