import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ClassDetails extends StatelessWidget {
  final int index;
  final dynamic item;
  ClassDetails(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    var startTime = formatDate(
        DateTime.fromMillisecondsSinceEpoch(item['starttijd']).toUtc(),
        [HH, ':', nn]);
    var endTime = formatDate(
        DateTime.fromMillisecondsSinceEpoch(item['eindtijd']).toUtc(),
        [HH, ':', nn]);

    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Hero(
                    tag: 'blueTimeBar$index',
                    // transitionOnUserGestures: true,
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0x10, 0x89, 0xFF, 1),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 40,
                    height: (kIsWeb ? 55 : 45),
                    child: RawMaterialButton(
                      child: Icon(
                        Icons.arrow_back,
                        size: (kIsWeb ? 28 : 25),
                      ),
                      shape: new CircleBorder(),
                      elevation: 15,
                      fillColor: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Hero(
                            tag: 'startTime$index',
                            child: Material(
                              color: Colors.transparent,
                              child: Text(
                                startTime + '  -  ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Hero(
                            tag: 'endTime$index',
                            child: SizedBox(
                              width: 120,
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  endTime,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            item['roosterdatum'].toString().substring(0,
                                item['roosterdatum'].toString().indexOf('T')),
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        item['commentaar'],
                        style: TextStyle(
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Text(
                      'Course: ' + item['vaknaam'],
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Text(
                      'Classroom: ' + item['lokaal'],
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Text(
                      'Teacher: ' +
                          item['docentnamen'].map((item) => item).toString(),
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
