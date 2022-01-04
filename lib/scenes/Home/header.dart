import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Header extends StatelessWidget {
  final SwiperController controller;
  Header(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      padding: EdgeInsets.only(top: 30),
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              // colors: [Color.fromRGBO(0x10, 0x89, 0xFF, 1), Colors.white],
            ),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 0.5,
                offset: Offset(
                  0,
                  3,
                ),
              )
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Color.fromRGBO(0x10, 0x89, 0xFF, 1),
            onTap: () => controller.move(0, animation: true),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.all(Radius.circular(30)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Text(
                      // formatDate(DateTime.now(), [DD, ' ', MM, ' ', dd]),
                      formatDate(DateTime.now(), [D, '\n', dd]),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
