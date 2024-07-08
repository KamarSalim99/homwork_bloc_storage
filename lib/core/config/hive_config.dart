import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../model/product_model.dart';

 Box? productHive;

hive()async{
   await Hive.initFlutter();
  productHive= await Hive.openBox("products");}