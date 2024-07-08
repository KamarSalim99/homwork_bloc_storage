import 'package:flutter/material.dart';

@immutable
sealed class ProductEvent{}

class GetAllProductEvent extends ProductEvent{}