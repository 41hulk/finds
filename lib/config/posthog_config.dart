import 'package:posthog_flutter/posthog_flutter.dart';

class PosthogConfig {
  static Future<void> initialize() async {
    // Create the configuration
    final config =
        PostHogConfig('phc_YsRNGqtQU1wH62WsRHEyYyYEIHVuY5vLqdDxZSuG7x5');

    // Enable debug mode and capture lifecycle events
    config.debug = true;
    config.captureApplicationLifecycleEvents = true;
    config.host = 'https://us.i.posthog.com';

    // Initialize PostHog with the configuration
    await Posthog().setup(config);
  }
}
