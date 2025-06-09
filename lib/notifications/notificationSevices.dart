import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  /// Initialise les notifications (Android & iOS)
  Future<void> initNotification() async {
    if (_isInitialized) return;

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await notificationsPlugin.initialize(settings);
    _isInitialized = true;
  }

  /// Définition des paramètres des notifications
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel_id',
        'Tâches du jour',
        channelDescription: 'Notifications pour les tâches quotidiennes',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  /// Affiche une notification simple
  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    await notificationsPlugin.show(id, title, body, notificationDetails());
  }

  // TODO: Ajouter la gestion du clic sur la notification si besoin
}
