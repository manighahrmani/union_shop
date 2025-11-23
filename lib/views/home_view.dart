import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/product_view_model.dart';
import '../widgets/app_header.dart';
import '../widgets/app_footer.dart';
import '../widgets/product_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProductViewModel>();

    return Scaffold(
      appBar: const AppHeader(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero section (keep existing UI or replace)
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const AppFooter(),
            // Products grid sourced from ViewModel
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(40),
              child: vm.loading
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: vm.products
                          .map((p) => ProductCard(title: p.name, price: '£${p.price.toStringAsFixed(2)}', imageUrl: p.imageUrl))
                          .toList(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}