import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  // this is a private constructor and can only be instantiated within this class
  AnalyticsService._();

  static final FirebaseAnalytics _a = FirebaseAnalytics.instance;

  static Future<void> setUserId(String uid) async {
    await _a.setUserId(id: uid);
  }

  static Future<void> clearUserId() async {
    await _a.setUserId(id: null);
  }

  static Future<void> setAuthMethod(String method) async {
    // e.g., "email_password" | "google"
    await _a.setUserProperty(name: 'auth_method', value: method);
  }

  static Future<void> logSignUp({required String method}) async {
    await _a.logSignUp(signUpMethod: method);
  }

  static Future<void> logLogin({required String method}) async {
    await _a.logLogin(loginMethod: method);
  }

  static Future<void> logLogout() async {
    // No built-in for logout; use a custom event
    await _a.logEvent(name: 'logout');
  }

  
}
