import 'package:flutter/services.dart';

class KmpWrapper {
  static const _channel = MethodChannel('com.example.kmp/channel');

  static Future<String> getPlatformInfo() async {
    try {
      return await _channel.invokeMethod('getPlatformInfo');
    } on PlatformException catch (e) {
      return "Failed to get platform info: ${e.message}";
    }
  }

  static Future<String> getPlatformTest() async {
    try {
      return await _channel.invokeMethod('getPlatformTest');
    } on PlatformException catch (e) {
      return "Failed to get platform info: ${e.message}";
    }
  }

  static Future<String> addText(symbol, text) async {
    try {
      return await _channel.invokeMethod('getAddText', {
        'symbol': symbol,
        'text': text,
      });
    } on PlatformException catch (e) {
      return "Failed to get platform info: ${e.message}";
    }
  }
}
