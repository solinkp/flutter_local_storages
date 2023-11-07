import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

Future<String> get globalAppDocDir async {
  var dir = await getApplicationSupportDirectory();
  return dir.path;
}

final snackbarKey = GlobalKey<ScaffoldMessengerState>();