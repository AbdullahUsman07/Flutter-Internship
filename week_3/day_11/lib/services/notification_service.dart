import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _flnp =
      FlutterLocalNotificationsPlugin();

  // Call this ONCE at app startup
  Future<void> init() async {
    // 1) Init plugin (icon = your app icon)
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );
    await _flnp.initialize(initSettings);
    final android = _flnp
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    await android?.requestNotificationsPermission();

    // 2) Timezone setup (required for scheduled/zoned notifications)
    tz.initializeTimeZones();
    final localTz = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(localTz));
  }

  // Common channel details
  NotificationDetails _details() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'task_channel',
        'Task Notifications',
        channelDescription: 'Task updates and reminders',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  // ---------------- Immediate notifications ----------------

  Future<void> showNow(String title, String body) async {
    await _flnp.show(0, title, body, _details());
  }

  Future<void> showTaskAdded(String title) => showNow('New Task Added', title);

  Future<void> showTaskDeleted(String title) => showNow('Task Deleted', title);

  // ---------------- Scheduled notifications ----------------

  // Create stable IDs for a task's reminders
  int _dueId(String taskId) => taskId.hashCode ^ 1111;
  int _overdueId(String taskId) => taskId.hashCode ^ 2222;

  /// Schedule a “Due Today” reminder at 9:00 AM on the due date
  Future<void> scheduleDueToday({
    required String taskId,
    required String taskTitle,
    required DateTime dueDate,
    int hour = 9,
    int minute = 0,
  }) async {
    final dt = tz.TZDateTime(
      tz.local,
      dueDate.year,
      dueDate.month,
      dueDate.day,
      hour,
      minute,
    );

    // If time already passed, don't schedule
    if (dt.isBefore(tz.TZDateTime.now(tz.local))) return;

    await _flnp.zonedSchedule(
      _dueId(taskId),
      'Due Today',
      taskTitle,
      dt,
      _details(),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.dateAndTime,
    );
  }

  /// Schedule an “Overdue” reminder at 9:00 AM next day after due date
  Future<void> scheduleOverdue({
    required String taskId,
    required String taskTitle,
    required DateTime dueDate,
    int hour = 9,
    int minute = 0,
  }) async {
    final nextMorning = DateTime(
      dueDate.year,
      dueDate.month,
      dueDate.day,
    ).add(const Duration(days: 1));
    final dt = tz.TZDateTime(
      tz.local,
      nextMorning.year,
      nextMorning.month,
      nextMorning.day,
      hour,
      minute,
    );

    if (dt.isBefore(tz.TZDateTime.now(tz.local))) return;

    await _flnp.zonedSchedule(
      _overdueId(taskId),
      'Overdue Task',
      taskTitle,
      dt,
      _details(),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.dateAndTime,
    );
  }

  /// Cancel both scheduled notifications for a task (when completed/deleted/edited)
  Future<void> cancelTaskSchedules(String taskId) async {
    await _flnp.cancel(_dueId(taskId));
    await _flnp.cancel(_overdueId(taskId));
  }

  Future<void> cancelDailySummary() => _flnp.cancel(9999);
}
