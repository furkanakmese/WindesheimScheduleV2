import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import '../ClassDetails/class_details.dart';

class ListItemWeb extends StatelessWidget {
  final dynamic item;
  final int index;
  ListItemWeb(this.item, this.index);

  @override
  Widget build(BuildContext context) {
    var startTime = formatDate(
        DateTime.fromMillisecondsSinceEpoch(item['starttijd']).toUtc(),
        [HH, ':', nn]);
    var endTime = formatDate(
        DateTime.fromMillisecondsSinceEpoch(item['eindtijd']).toUtc(),
        [HH, ':', nn]);

    return Container(
      child: Stack(
        children: <Widget>[
          Hero(
            tag: 'blueTimeBar$index',
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(0x82, 0x93, 0xFF, 1),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      spreadRadius: 0.5,
                      offset: Offset(
                        0,
                        2,
                      ),
                    )
                  ]),
            ),
          ),
          Container(
            // padding: EdgeInsets.fromLTRB(12, 15, 15, 10),
            height: 100,
            width: 200,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Color.fromRGBO(0x10, 0x89, 0xFF, 1),
                onTap: () {
                  Navigator.push(
                      context,
                      // PageRouteBuilder(
                      //     transitionDuration: Duration(milliseconds: 400),
                      //     pageBuilder: (context, animation, animation2) =>
                      //         ClassDetails(index, item)));
                  MaterialPageRoute(
                      builder: (context) => ClassDetails(index, item)));
                },
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Container(
                  padding: EdgeInsets.fromLTRB(12, 15, 15, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        startTime + ' - ' + endTime,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Container(
                          width: 150,
                          child: Text(
                            item['commentaar'],
                            overflow: TextOverflow.ellipsis,
                            // maxLines: 2,
                            softWrap: false,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              // backgroundColor: Colors.transparent,// Color.fromRGBO(0x82, 0x93, 0xFF, 1),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        width: 150,
                        child: Text(
                          item['lokaal'],
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          // maxLines: 1,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
