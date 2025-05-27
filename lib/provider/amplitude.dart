import 'dart:developer';

import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitude_flutter/configuration.dart';
import 'package:amplitude_flutter/events/base_event.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taher_portfolio/core/constants/environment.dart';

final amplitudeProvider =
    ChangeNotifierProvider(((ref) => AmplitudeProvider()));

class AmplitudeProvider extends ChangeNotifier {
  Amplitude? analytics;
  late DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  bool _isInitialized = false;

  AmplitudeProvider() {
    _initializeAmplitude();
  }

  Future<void> _initializeAmplitude() async {
    analytics = Amplitude(Configuration(
      apiKey: AppEnvironment.amplitudeAPIKey,
    ));
    
    // Wait until the SDK is initialized
    try {
      await analytics?.isBuilt;
      _isInitialized = true;
    } catch (e) {
      log("Error initializing Amplitude: $e");
    }
  }

  Future<void> logStartupEvent() async {
    if (!_isInitialized) {
      await _initializeAmplitude();
    }
    
    Map<String, dynamic> info = {};
    if (kIsWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;

      info.addAll({
        "browser": webBrowserInfo.browserName.name,
        "platform": webBrowserInfo.platform.toString(),
        "userAgent": webBrowserInfo.userAgent.toString(),
        "product": webBrowserInfo.product.toString(),
        "vendor": webBrowserInfo.vendor.toString(),
        "language": webBrowserInfo.language.toString(),
      });
    }
    log("info: $info");
    try {
      analytics?.track(BaseEvent('startup', eventProperties: info));
    } catch (e) {
      log("Error tracking startup event: $e");
    }
  }

  Future<void> logAScreen(String screenName) async {
    if (!_isInitialized) {
      await _initializeAmplitude();
    }
    
    Map<String, dynamic> info = {};

    info.addAll({
      "screenName": screenName,
    });

    log("info: $info");
    try {
      analytics?.track(BaseEvent('screens_log', eventProperties: info));
    } catch (e) {
      log("Error tracking screen view: $e");
    }
  }

  Future<void> logJsonParseError(Map<String, dynamic> json) async {
    if (!_isInitialized) {
      await _initializeAmplitude();
    }
    
    log("info: $json");
    try {
      analytics?.track(BaseEvent('json_parse_error', eventProperties: json));
    } catch (e) {
      log("Error tracking JSON parse error: $e");
    }
  }
}
