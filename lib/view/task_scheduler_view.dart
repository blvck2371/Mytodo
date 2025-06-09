import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytodo/contollers/task_scheduler_controller.dart';

class TaskSchedulerView extends StatelessWidget {
  final TaskSchedulerController controller = Get.put(TaskSchedulerController());

  TaskSchedulerView({super.key});

  final TextEditingController timeInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Planification des Tâches")),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: controller.hours.length,
                itemBuilder: (context, index) {
                  final hour = controller.hours[index].time;
                  return ListTile(
                    title: Text(hour),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => controller.removeHour(hour),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: timeInput,
              decoration: const InputDecoration(
                labelText: 'Ajouter heure (HH:mm)',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final time = timeInput.text;
              if (RegExp(r'^\d{2}:\d{2}$').hasMatch(time)) {
                controller.addHour(time);
                timeInput.clear();
              } else {
                Get.snackbar("Erreur", "Format invalide. Utilise HH:mm");
              }
            },
            child: const Text("Ajouter Heure"),
          ),
        ],
      ),
    );
  }
}
