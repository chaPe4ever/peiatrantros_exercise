import 'dart:async';

import 'package:peiatrantros_exercise/core/enums/enum_connectivity_status.dart';

abstract class IConnectivity {
  Future<bool> get isConnected;
  StreamController<EnumConnectivityStatus>? get connectionStatusController;
}
