pluginManagement {
    val flutterSdkPath = run {
        val properties = java.util.Properties()
        file("local.properties").inputStream().use { properties.load(it) }
        val flutterSdkPath = properties.getProperty("flutter.sdk")
        require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
        flutterSdkPath
    }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"

    // ✅ Update Android Gradle Plugin (AGP)
    id("com.android.application") version "8.7.0" apply false

    // ✅ Use latest Google Services for Firebase
    id("com.google.gms.google-services") version "4.4.2" apply false

    // ✅ Upgrade Kotlin to 2.0.21 for Firebase compatibility
    id("org.jetbrains.kotlin.android") version "2.0.21" apply false
}

include(":app")
