import 'package:flutter/material.dart';
import 'package:homwork_bloc_storage/core/model/handling.dart';
import 'package:homwork_bloc_storage/core/model/product_model.dart';

@immutable
sealed class ProductState{}

final class ProductInitialState extends ProductState{}

class SuccessGetProductState extends ProductState{
  final ListOf<ProductModel>  productModels;
  SuccessGetProductState({required this.productModels});
}
class StorageState extends ProductState{
  final ListOf<ProductModel>  productModelsStorage;
  StorageState({required this.productModelsStorage});
}
class LoadingGetProductState extends ProductState{}

class ErrorGetProductState extends ProductState{}