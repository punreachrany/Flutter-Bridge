import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let batteryChannel = FlutterMethodChannel(name: "battery",
                                                      binaryMessenger: controller.binaryMessenger)
        
        batteryChannel.setMethodCallHandler({
              (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
              // Note: this method is invoked on the UI thread.
              // Handle battery messages.
            guard call.method == "getBatteryPercentage" else {
                result(FlutterError(code: "UNAVAILABLE",
                                    message: "Battery info unavailable",
                                    details: nil))
                return
              }
            result("10 iOS")
            })
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
