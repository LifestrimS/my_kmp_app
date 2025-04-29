pluginManagement {
    repositories {
        gradlePluginPortal()
        mavenCentral()
        google()
    }
    plugins {
        id("org.jetbrains.kotlin.multiplatform") version "1.9.22"
        id("com.android.library") version "8.1.2"
    }
}

rootProject.name = "kmp_module"
include(":shared")