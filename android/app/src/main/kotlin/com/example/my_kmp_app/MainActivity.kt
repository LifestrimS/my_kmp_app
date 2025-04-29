package com.example.my_kmp_app

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.example.shared.Platform  // Импорт из KMP модуля


class MainActivity: FlutterActivity() {
    private val platform = Platform()  // Создаем экземпляр Platform из KMP

    private val CHANNEL = "com.example.kmp/channel"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            when (call.method) {
                "getPlatformInfo" -> result.success(platform.platform)
                else -> result.notImplemented()
            }
        }
    }
}