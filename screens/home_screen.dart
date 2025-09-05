import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uh_pm/models/app_state.dart';
import 'package:uh_pm/widgets/task_card.dart';
import 'plant_detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showAddTaskDialog(BuildContext context) {
    String title = "";
    String subtitle = "";

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Add new task"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "Task title"),
                onChanged: (val) => title = val,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Task subtitle"),
                onChanged: (val) => subtitle = val,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (title.isNotEmpty && subtitle.isNotEmpty) {
                  context.read<AppState>().addTask(title, subtitle);
                }
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _showAddPlantDialog(BuildContext context) {
    String name = "";
    String task = "";
    String planted = "";

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Add new plant"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "Plant name"),
                onChanged: (val) => name = val,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Action"),
                onChanged: (val) => task = val,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Planted info"),
                onChanged: (val) => planted = val,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (name.isNotEmpty && task.isNotEmpty && planted.isNotEmpty) {
                  context.read<AppState>().addPlant(name, task, planted);
                }
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(title: const Text("Plant Care")),
      backgroundColor: const Color(0xFFEECFFC),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            heroTag: "add_task",
            backgroundColor: Colors.lightGreenAccent,
            onPressed: () => _showAddTaskDialog(context),
            label: const Text("Add Task"),
            icon: const Icon(Icons.add_task),
          ),
          const SizedBox(height: 12),
          FloatingActionButton.extended(
            heroTag: "add_plant",
            backgroundColor: Colors.pinkAccent,
            onPressed: () => _showAddPlantDialog(context),
            label: const Text("Add Plant"),
            icon: const Icon(Icons.local_florist),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Halo!",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),
            const Text(
              "Don't forget",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // ✅ Task List dengan tombol delete
            for (int i = 0; i < state.tasks.length; i++)
              TaskCard(
                task: state.tasks[i],
                onChanged: (val) =>
                    context.read<AppState>().toggleTask(i, val ?? false),
                onDelete: () =>
                    context.read<AppState>().removeTask(i),
              ),

            const SizedBox(height: 20),
            const Text(
              "Your plants",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // ✅ Plant List
            for (final plant in state.plants)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PlantDetailScreen(plant: plant),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: plant.bgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.local_florist, size: 40),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              plant.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(plant.task),
                            Text(
                              plant.planted,
                              style: const TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
