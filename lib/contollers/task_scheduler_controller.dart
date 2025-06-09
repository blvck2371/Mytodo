import 'dart:async';
import 'package:get/get.dart';
import 'package:mytodo/model/hour_model.dart';
import 'package:mytodo/notifications/notificationSevices.dart';

class TaskSchedulerController extends GetxController {
  final RxList<HourModel> hours = <HourModel>[].obs;
  final Map<String, Timer> _timers = {};

  @override
  void onInit() {
    super.onInit();
    hours.addAll([
      HourModel(time: '12:30'),
      HourModel(time: '13:40'),
      HourModel(time: '17:12'),
    ]);
    _scheduleAll();
  }

  DateTime _getNextExecutionTime(String hourStr) {
    final parts = hourStr.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    var now = DateTime.now();
    var scheduled = DateTime(now.year, now.month, now.day, hour, minute);
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }

  void executeTask(String hour) {
    print("✅ Tâche exécutée à $hour");
    // Ta logique ici (notification, alarme, etc.)
  }

  void _scheduleHour(HourModel model) {
    final duration = _getNextExecutionTime(
      model.time,
    ).difference(DateTime.now());
    final timer = Timer(duration, () {
      executeTask(model.time);

      /// end
      ///
      ///
      NotificationServices().showNotification(
        id: 0,
        body: 'Sultan de brunel',
        title: 'Oklm',
      );

      ///
      _scheduleHour(model); // Replanifie
    });
    _timers[model.time] = timer;
  }

  void _scheduleAll() {
    for (var h in hours) {
      _scheduleHour(h);
    }
  }

  void addHour(String time) {
    if (!hours.any((e) => e.time == time)) {
      final model = HourModel(time: time);
      hours.add(model);
      _scheduleHour(model);
    }
  }

  void removeHour(String time) {
    hours.removeWhere((e) => e.time == time);
    _timers[time]?.cancel();
    _timers.remove(time);
  }

  @override
  void onClose() {
    _timers.forEach((_, timer) => timer.cancel());
    super.onClose();
  }
}
