import 'package:flutter/material.dart';

class TaskItem {
  String title;
  String subtitle;
  bool isDone;
  Color bgColor;

  TaskItem({
    required this.title,
    required this.subtitle,
    this.isDone = false,
    this.bgColor = Colors.white,
  });
}

class PlantItem {
  String name;
  String task;
  String planted;
  Color bgColor;

  PlantItem({
    required this.name,
    required this.task,
    required this.planted,
    required this.bgColor,
  });
}

class AppState extends ChangeNotifier {
  final List<TaskItem> tasks = [];
  final List<PlantItem> plants = [];

  // daftar warna berbeda untuk plant
  final List<Color> _plantColors = [
    Colors.greenAccent,
    Colors.lightBlueAccent,
    Colors.pinkAccent,
    Colors.amberAccent,
    Colors.purpleAccent,
    Colors.tealAccent,
    Colors.orangeAccent,
  ];

  int _colorIndex = 0;

  void addTask(String title, String subtitle) {
    tasks.add(TaskItem(
      title: title,
      subtitle: subtitle,
      isDone: false,
      bgColor: Colors.yellow.shade100,
    ));
    notifyListeners();
  }

  void toggleTask(int index, bool value) {
    tasks[index].isDone = value;
    notifyListeners();
  }

  void addPlant(String name, String task, String planted) {
    // pilih warna dari daftar secara bergilir
    final color = _plantColors[_colorIndex % _plantColors.length];
    _colorIndex++;

    plants.add(PlantItem(
      name: name,
      task: task,
      planted: planted,
      bgColor: color,
    ));
    notifyListeners();

    
  }
  void removeTask(int index) {
  tasks.removeAt(index);
  notifyListeners();
}

void removePlant(PlantItem plant) {
  plants.remove(plant);
  notifyListeners();
}

}

