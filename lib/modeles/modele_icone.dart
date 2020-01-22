import 'package:flutter/material.dart';

class ModeleIcone {
  IconData icon;
  bool isSelected;
  ModeleIcone(this.icon, this.isSelected);
}

List<ModeleIcone> icones = [
  ModeleIcone(Icons.flight, false),
  ModeleIcone(Icons.directions_car, true),
  ModeleIcone(Icons.panorama, false),
  ModeleIcone(Icons.motorcycle, false),
];
