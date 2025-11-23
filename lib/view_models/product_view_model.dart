import 'package:flutter/foundation.dart';
import '../models/product_model.dart';
import '../repositories/product_repository.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository _repo;
  List<Product> _products = [];
  bool _loading = false;

  ProductViewModel({ProductRepository? repo}) : _repo = repo ?? ProductRepository();

  List<Product> get products => _products;
  bool get loading => _loading;

  Future<void> loadProducts() async {
    _loading = true;
    notifyListeners();

    _products = await _repo.fetchProducts();

    _loading = false;
    notifyListeners();
  }

  Product? productById(String id) {
    try {
      return _products.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }
      
}
