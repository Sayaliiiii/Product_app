import '../../domain/repositories/product_repo.dart';
import '../models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductDataService implements ProductRepo {
  @override
  Future<List<ProductDataModel>> getProduct() async {
    print('object12');
    var response = await http
        .get(Uri.parse('https://api.punkapi.com/v2/beers?page=1&per_page=30'));
    print('object14');
    try {
      if (response.statusCode == 200) {
        print(response.statusCode);
        final data = productDataModelFromJson(response.body);
        return data;
      }
    } catch (e) {
      print(' error');
      print(e.toString());
    }
    throw Exception();
  }
}
