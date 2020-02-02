// import 'package:universal_html/prefer_sdk/html.dart';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

void saveClassName(String className) async {
  // if (kIsWeb) {
  //   final Storage _localStorage = window.localStorage;
  //   _localStorage['className'] = className;
  // } else {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('className', className);
  // }
}

Future<String> getClassName() async {
  try {
    // if (kIsWeb) {
    //   final Storage _localStorage = window.localStorage;
    //   return _localStorage['className'] != null ? _localStorage['className'] : '';
    // } else {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String className = prefs.getString('className');
    return className == null ? '' : className;
    // }
  } catch (error) {
    print(error);
    return '';
  }
}
