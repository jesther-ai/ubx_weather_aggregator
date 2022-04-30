import 'package:flutter/foundation.dart';

class RefreshLimit with ChangeNotifier {
  int _count = 0;
  bool _pendingDelay = false;
  bool get onLimit {
    if (_count < 3) {
      return true;
    } else {
      return false;
    }
  }

  setCount() {
    _count++;
    if (_pendingDelay == false) {
      Future.delayed(const Duration(seconds: 10), () {
        _count = 0;
        _pendingDelay = false;
      });
    }
    _pendingDelay = true;
  }
}
