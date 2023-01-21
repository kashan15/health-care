import 'package:flutter/material.dart';
import 'package:soulgood/client-side-views/log.dart';

class LogController extends ValueNotifier<List<String>> {
  LogController() : super([]);

  void addLog(String log) {
    value = [log, ...value];
  }
}
