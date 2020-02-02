import 'dart:ui' as ui;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'file:///Users/furkanakmese/Developer/WindesheimScheduleV2/lib/generated_plugin_registrant.dart';
import "file:///Users/furkanakmese/Developer/WindesheimScheduleV2/lib/main.dart" as entrypoint;

Future<void> main() async {
  registerPlugins(webPluginRegistry);
  if (true) {
    await ui.webOnlyInitializePlatform();
  }
  entrypoint.main();
}
