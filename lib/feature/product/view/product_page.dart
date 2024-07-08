import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:homwork_bloc_storage/feature/product/bloc/product_bloc.dart';
import 'package:homwork_bloc_storage/feature/product/bloc/product_event.dart';
import 'package:homwork_bloc_storage/feature/product/bloc/product_state.dart';

import '../../../core/model/product_model.dart';
import '../../../core/service/product_service.dart';

class ProductPage extends StatefulWidget {
   ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  
 
 @override
  void initState() {
     var path = Directory.current.path;
  Hive
    ..init(path)
    ..registerAdapter(ProductAdapter());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(GetAllProductEvent()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if(state is SuccessGetProductState){
                 return ListView.builder(
                    itemCount: state.productModels.data.length ,
                    itemBuilder: (context, index) {
                       if((index) == state.productModels.data.length ){
                                    if(connectivityResult == ConnectivityResult.none){
                                      return SizedBox();
                                    }
                                  }else
                     { print(state.productModels.data[index].image);
                        ListTile(
                        leading: Image.network(
                          state.productModels.data[index].image),
                          
                        title: Text(state.productModels.data[index].name),
                        subtitle: Text(state.productModels.data[index].brand),
                      );}}
                  );
              }else if(state is ErrorGetProductState){
                 return Text("There is no internet");
              }else{
                return Center(child: CupertinoActivityIndicator(color: Colors.black45,));
              }
            
            },
          ),
        );
      }),
    );
  }
}
