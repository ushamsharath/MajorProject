plugins {
    id("com.android.application")
    // ✅ FlutterFire Google Services
    id("com.google.gms.google-services")
    // ✅ Kotlin for Android
    id("org.jetbrains.kotlin.android")
    // ✅ Flutter Gradle plugin
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.crowd_ai"
    compileSdk = flutter.compileSdkVersion

    // ✅ Use the latest NDK (required for Firebase plugins)
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    defaultConfig {
        applicationId = "com.example.crowd_ai"
        minSdk = 23 // ✅ Required by firebase_analytics and other Firebase plugins
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

// ✅ Apply Google Services plugin at the bottom
apply(plugin = "com.google.gms.google-services")
