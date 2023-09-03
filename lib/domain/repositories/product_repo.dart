import '../../data/models/product_model.dart';

abstract class ProductRepo {
 Future<List<ProductDataModel>> getProduct();
}
