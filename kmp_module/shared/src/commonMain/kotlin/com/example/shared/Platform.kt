package com.example.shared  // Должен совпадать с namespace

expect class Platform() {
    val platform: String

    val channelTest: String

    fun addText(symbol: String, text: String): String
}