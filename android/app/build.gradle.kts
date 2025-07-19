plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val compileSdkVer = 35
val ndkVer = "27.0.12077973"
val minSdkVer = 21

android {
    namespace = "io.agus.starter"
    compileSdk = compileSdkVer
    ndkVersion = ndkVer

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "io.agus.starter"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = minSdkVer
        targetSdk = compileSdkVer
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    // enable if release
    // signingConfigs {
       // create("release") {
        //    keyAlias = keystoreProperties["keyAlias"]
        //    keyPassword = keystoreProperties["keyPassword"]
        //    storeFile = file(keystoreProperties["storeFile"] ?: "")
        //    storePassword = keystoreProperties["storePassword"]
       // }
    // }

    flavorDimensions += "environment"

    productFlavors {
        create("dev") {
            dimension = "environment"
            applicationId = "io.agus.app.dev"
            resValue("string", "app_name", "Starter Dev")
        }

        create("staging") {
            dimension = "environment"
            applicationId = "io.agus.staging.starter"
            resValue("string", "app_name", "Starter Staging")
        }

        create("production") {
            dimension = "environment"
            applicationId = "io.agus.app.starter"
            resValue("string", "app_name", "Starter")
        }
    }

    sourceSets {
        getByName("main").java.srcDirs("src/main/kotlin")
        getByName("dev").setRoot("src/dev")
        getByName("staging").setRoot("src/staging")
        getByName("production").setRoot("src/production")
    }

    buildTypes {
        getByName("debug") {
            isMinifyEnabled = true
            signingConfig = signingConfigs["debug"]
        }
        getByName("release") {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs["debug"]
            // if project release
            // signingConfig = signingConfigs["release"]
        }
    }
}

flutter {
    source = "../.."
}
