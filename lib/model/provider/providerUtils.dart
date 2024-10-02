import 'package:flutter/material.dart';
import 'package:secondtest/VariableData.dart';

class ProviderUtils with ChangeNotifier {
  bool ProviderOnConnection = false;

  UpdateOnConnection(bool value) {
    ProviderOnConnection = value;
    isConnected = value;
    notifyListeners();
  }
}
