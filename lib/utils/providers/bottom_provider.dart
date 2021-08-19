import 'package:flutter/material.dart';

class WidgeIndex extends ChangeNotifier {
  int indexWidget = 0;
  int get count => indexWidget;

  // ignore: missing_return
  int changevalue(int indexWid) {
    indexWidget = indexWid;
    notifyListeners();
    return indexWidget;
  }
}
