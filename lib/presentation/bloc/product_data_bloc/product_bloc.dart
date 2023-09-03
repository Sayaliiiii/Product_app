import 'package:bloc/bloc.dart';
import 'package:product_app/domain/repositories/product_repo.dart';
// import 'package:product_app/presentation/bloc/product_data_bloc/product_event.dart';
import 'package:product_app/presentation/bloc/product_data_bloc/product_state.dart';
// import 'package:product_app/domain/repositories/product_repo.dart';

class ProductBloc extends Cubit<ProductState> {
  ProductRepo productRepo;
  ProductBloc(this.productRepo) : super(ProductState());

  void loadedApi() async {
    emit(state.copywith(isLoading: true));
    try {
      print('object');
      final productdetails = await productRepo.getProduct();
      print('going inside');
      emit(state.copywith(
          products:productdetails ,
          isLoaded: true,
          isLoading: false,
          isError: false));
    } catch (e) {
      print('erfhbdsncd');
      emit(state.copywith(isError: true, isLoading: false, errorMsg: "error"));
    }
  }
}
