package com.example.shared  // Тот же пакет

actual class Platform actual constructor() {
    actual val platform: String = "Android ${android.os.Build.VERSION.SDK_INT}"

    actual val channelTest: String = "Hello from channelTest"

    actual fun addText(symbol: String, text: String): String {
        return text + symbol;
    }
}