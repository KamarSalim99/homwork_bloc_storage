import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:homwork_bloc_storage/core/model/handling.dart';
import 'package:homwork_bloc_storage/core/model/product_model.dart';
import 'package:homwork_bloc_storage/core/service/core_service.dart';

import '../config/hive_config.dart';

abstract class ProductService extends CoreService{
  String basUrl="https://freetestapi.com/api/v1/products";
  Future<ResultModel> getAllProduct();
}
List<ProductModel> productModel=[];
List getFromBox=[];
List putInBox=[];

Connectivity connectivity = Connectivity();
ConnectivityResult? connectivityResult;

class ProductServiceImp extends ProductService{
late List<ConnectivityResult> result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    


  @override
  Future<ResultModel> getAllProduct() async{
    result = await connectivity.checkConnectivity();
    try{
    response = await dio.get(basUrl);
  if(connectivityResult!= ConnectivityResult.none || connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile){
      print("From server"); 
      if(response.statusCode==200){
        productModel =List.generate(productModel.length,(index)=> ProductModel.fromMap(response.data[index]));        
        putInBox.addAll(productModel);
        productHive!.delete("products");
        productHive!.put("products", putInBox);
        print(productHive!.get("products"));
        return ListOf(data: productModel);
      }
      else{
        return ErrorModel();
       }
     }else{
        print("from storage");
        getFromBox=productHive!.get("products");
        if(getFromBox!= []){
           return ListOf(data:getFromBox);
        }else{
            return ExceptionModel(message: "there is not storage");
        }
      }
     }on DioException catch(e){
      print(e.message);
      return ExceptionModel(message: e.message);
    }
   
  }
}
