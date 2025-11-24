import '../models/product_model.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    // Simulate network / DB delay
    await Future.delayed(const Duration(milliseconds: 200));
    return [
      Product(
        id: '1',
        name: 'Placeholder Product 1',
        description: 'Placeholder description 1',
        price: 10.0,
        imageUrl:
            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      ),
      Product(
        id: '2',
        name: 'Placeholder Product 2',
        description: 'Placeholder description 2',
        price: 15.0,
        imageUrl:
            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      ),
    ];
  }
}
