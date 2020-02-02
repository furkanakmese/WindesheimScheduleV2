import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HeaderWeb extends StatefulWidget {
  final SwiperController controller;
  HeaderWeb(this.controller);

  @override
  _HeaderWebState createState() => _HeaderWebState();
}

class _HeaderWebState extends State<HeaderWeb> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.10,
        margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: Container(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              // splashColor: Color.fromRGBO(0x10, 0x89, 0xFF, 1),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              onTap: () => widget.controller.move(0, animation: true),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  formatDate(DateTime.now(), [DD, '\n', MM, ' ', dd]),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
