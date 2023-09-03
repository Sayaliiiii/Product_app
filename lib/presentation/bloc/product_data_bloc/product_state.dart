import 'package:product_app/data/models/product_model.dart';
class ProductState {
  final bool isLoading;
  final bool isLoaded;
  final bool isError;
  final List<ProductDataModel>? products;
  final String errorMsg;

  ProductState(
      {this.isLoading = false,
      this.isLoaded = false,
      this.isError = false,
       this.products,
      this.errorMsg = ""});
  ProductState copywith({
    bool? isLoading,
    bool? isLoaded,
    bool? isError,
    List<ProductDataModel>? products,
    String? errorMsg,
  }) {
    return ProductState(
        products: products ?? this.products,
        errorMsg: errorMsg ?? this.errorMsg,
        isError: isError ?? this.isError,
        isLoaded: isLoaded ?? this.isLoaded,
        isLoading: isLoading ?? this.isLoading);
  }
}
