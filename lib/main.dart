import 'package:flutter/material.dart';
import 'package:proform1/src/app.dart';
import 'package:proform1/src/helpers/api_helper.dart';

void main() {
  ApiHelper.initialize();
  runApp(const MyApp());
}
