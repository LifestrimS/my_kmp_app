package com.example.my_kmp_app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.example.shared.Platform

const val CHANNEL = "com.example.kmp/channel"

class MainActivity: FlutterActivity() {
    private val platform = Platform()
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "getPlatformInfo") {
                result.success(platform.platform)

            } else if (call.method == "getPlatformTest") {
                result.success(platform.channelTest)
            } else if (call.method == "getAddText") {
                val data = call.arguments as? Map<*, *>

                result.success(platform.addText(
                    data?.get("symbol").toString(),
                    data?.get("text").toString()
                ))
            }
            else {
                result.notImplemented()
            }
        }
    }
}