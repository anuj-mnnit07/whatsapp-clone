import 'dart:developer';
import 'package:socket_io_client/socket_io_client.dart';

class SignallingService {
  // instance of Socket
  Socket? socket;

  SignallingService._();
  static final instance = SignallingService._();

  init({required String websocketUrl, required String selfCallerID, required String remoteCallerId}) {
    // init Socket
    log("call socket init called");
    socket = io(websocketUrl, {
      "transports": ['websocket'],
      "query": {"callerId": selfCallerID}
    });

    // listen onConnect event
    socket!.onConnect((data) {
      log("call Socket connected !!");
    });

    // listen onConnectError event
    socket!.onConnectError((data) {
      log("call Connect Error $data");
    });

    // connect socket
    socket!.connect();
  }
}
