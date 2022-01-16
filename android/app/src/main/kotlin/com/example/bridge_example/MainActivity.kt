package com.example.bridge_example

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterView
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import java.lang.reflect.Method

class MainActivity: FlutterActivity() {
//    override fun onCreate(savedInstanceState: Bundle?) {
//        super.onCreate(savedInstanceState)
//
//    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "battery").setMethodCallHandler {
            call, result ->
            // Note: this method is invoked on the main thread.
            // TODO
            if(call.method == "getBatteryPercentage") {
                result.success("10 Android")
            } else {
                result.error("424","Please check", "Wrong Implementation")
            }

        }
    }

}
