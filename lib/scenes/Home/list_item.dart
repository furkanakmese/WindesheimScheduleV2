import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import '../ClassDetails/class_details.dart';

class ListItem extends StatelessWidget {
  final dynamic item;
  final int index;
  ListItem(this.item, this.index);
  // final int rndNum = DateTime.now().millisecondsSinceEpoch;

  @override
  Widget build(BuildContext context) {
    var startTime = formatDate(
        DateTime.fromMillisecondsSinceEpoch(item['starttijd']).toUtc(),
        [HH, ':', nn]);
    var endTime = formatDate(
        DateTime.fromMillisecondsSinceEpoch(item['eindtijd']).toUtc(),
        [HH, ':', nn]);
            
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
      decoration: new BoxDecoration(
        color: Color.fromRGBO(0xEA, 0xED, 0xFC, 1),
        borderRadius: new BorderRadius.all(Radius.circular(20)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ClassDetails(index, item))),
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
            // decoration: BoxDecoration(
            //   borderRadius: new BorderRadius.all(Radius.circular(20)),
            // ),
            child: Row(
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Hero(
                        tag: 'blueTimeBar$index',
                        // transitionOnUserGestures: true,
                        child: Container(
                          // padding: EdgeInsets.all(30),
                          width: 55,
                          height: 55,
                          margin: EdgeInsets.only(right: 20),
                          decoration: new BoxDecoration(
                            color: Color.fromRGBO(0x10, 0x89, 0xFF, 1),
                            borderRadius:
                                new BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                      ),
                      Container(
                        // padding: EdgeInsets.all(10),
                        width: 55,
                        height: 55,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Hero(
                              tag: 'startTime$index',
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  startTime,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Hero(
                              tag: 'endTime$index',
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  endTime,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 3),
                        child: Hero(
                          tag: 'title$index',
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              item['commentaar'],
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        item['lokaal'],
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
