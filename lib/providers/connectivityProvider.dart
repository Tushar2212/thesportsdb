import 'package:flutter/cupertino.dart';

class ConnectivityProvider extends ChangeNotifier
{
  bool _isConnected = true;

  bool get isConnectedToNetwork => _isConnected;

  set isConnectedToNetwork(bool pNetworkStatus)
  {
    _isConnected = pNetworkStatus;
    notifyListeners();
  }
}