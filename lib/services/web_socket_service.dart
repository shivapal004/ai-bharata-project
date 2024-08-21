import 'dart:convert';
import 'dart:developer';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../model/ampiyData.dart';

class WebSocketService {
  final WebSocketChannel channel;
  final void Function(AmpiyData) onDataReceived;

  WebSocketService({
    required String url,
    required this.onDataReceived,
  }) : channel = WebSocketChannel.connect(Uri.parse(url)) {
    _listenToWebSocket();
  }

  void _listenToWebSocket() {
    channel.stream.listen((message) {
      final data = jsonDecode(message);
      final ampiyData = AmpiyData.fromJson(data);
      onDataReceived(ampiyData);
    }, onError: (error) {
      log('Error: $error');
    });
  }

  void sendSubscription() {
    channel.sink.add(jsonEncode({
      "method": "SUBSCRIBE",
      "params": ["all@ticker"],
      "cid": 1,
    }));
  }

  // void _subscribeToChannel() {
  //   channel.sink.add(jsonEncode({
  //     "method": "SUBSCRIBE",
  //     "params": ["all@ticker"],
  //     "cid": 1,
  //   }));
  // }

  void dispose() {
    channel.sink.close();
  }
}
