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

  static Future<void> taskCreated({
    required String taskId,
    String? priority, // optional if you use priorities
    DateTime? dueDate, // track due date if you want
  }) async {
    await _a.logEvent(
      name: 'task_created',
      parameters: {
        'task_id': taskId,
        if (priority != null) 'priority': priority,
        if (dueDate != null) 'due_date': dueDate.toIso8601String(),
      },
    );
  }

  static Future<void> taskCompleted({
    required String taskId,
    DateTime? completedAt,
  }) async {
    await _a.logEvent(
      name: 'task_completed',
      parameters: {
        'task_id': taskId,
        if (completedAt != null) 'completed_at': completedAt.toIso8601String(),
      },
    );
  }

  static Future<void> taskUpdated({
    required String taskId,
    bool? changedTitle,
    bool? changedDueDate,
    bool? changedPriority,
  }) async {
    await _a.logEvent(
      name: 'task_updated',
      parameters: {
        'task_id': taskId,
        if (changedTitle != null)
          'changed_title': changedTitle ? 'true' : 'false',
        if (changedDueDate != null)
          'changed_due': changedDueDate ? 'true' : 'false',
        if (changedPriority != null)
          'changed_priority': changedPriority ? 'true' : 'false',
      },
    );
  }

  static Future<void> taskDeleted({required String taskId}) async {
    await _a.logEvent(name: 'task_deleted', parameters: {'task_id': taskId});
  }
}
