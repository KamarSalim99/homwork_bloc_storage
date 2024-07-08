import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homwork_bloc_storage/core/model/handling.dart';
import 'package:homwork_bloc_storage/core/model/product_model.dart';
import 'package:homwork_bloc_storage/core/service/product_service.dart';
import 'package:homwork_bloc_storage/feature/product/bloc/product_event.dart';
import 'package:homwork_bloc_storage/feature/product/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{
  ProductBloc():super(ProductInitialState()){

  on<GetAllProductEvent>((event,emit)async {
    emit(LoadingGetProductState());
    ResultModel result=await ProductServiceImp().getAllProduct();
    if( result is ListOf<ProductModel>){
            emit(SuccessGetProductState(productModels: result));     
        }else if(result is ErrorModel){
          emit(ErrorGetProductState());
        }
    
  });
  }

}