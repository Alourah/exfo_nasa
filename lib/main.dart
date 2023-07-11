import 'package:flutter/material.dart';
import 'package:nasa_workshop/core/nasa_app.dart';
import 'package:nasa_workshop/utils/di_container.dart';

void main() {
  setupDependencyInjection();
  runApp(const NasaApp());
}
