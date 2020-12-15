import 'dart:isolate';


main (){

  int counter = 0;

  ReceivePort mainReceivePort = new ReceivePort();

  mainReceivePort.listen((fooSendPort) {
    if (fooSendPort is SendPort){
      fooSendPort.send(counter++);
    }
    else{
      print(fooSendPort);
    }
  });

  for (var i =0; i<5; i++){
    Isolate.spawn(isolateTest, mainReceivePort.sendPort);
  }
}

isolateTest(SendPort mainSendPort){
  ReceivePort fooReceivePort = new ReceivePort();
  mainSendPort.send(fooReceivePort.sendPort);

  fooReceivePort.listen((msg) {
    mainSendPort.send('im received : $msg');
  });
}