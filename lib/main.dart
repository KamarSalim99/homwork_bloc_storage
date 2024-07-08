import 'package:flutter/material.dart';
import 'package:homwork_bloc_storage/core/config/hive_config.dart';
import 'package:homwork_bloc_storage/feature/product/view/product_page.dart';

void main() {
  hive();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:ProductPage()
    );
  }
}