import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/cupertino.dart';

void setRebirth(BuildContext context) {
  ReceivePort receivePort = new ReceivePort();
  IsolateNameServer.removePortNameMapping('rebirth');
  IsolateNameServer.registerPortWithName(receivePort.sendPort, 'rebirth');
  receivePort.listen((message) {
    if (message == 'start') {
      Navigator.pushNamed(context, '/alarm');
      receivePort.close();
      IsolateNameServer.removePortNameMapping('rebirth');
    }
  });
}
