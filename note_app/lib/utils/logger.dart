
import 'package:flutter/material.dart';

class Logger {

  static const String _tag = "movie";

  static const bool _isDebug = true;

  static void loggerDebug(String log){
    if(_isDebug){
      debugPrint("$_tag : $log");
    }
  }

}
