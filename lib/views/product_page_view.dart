import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/product_view_model.dart';
import '../widgets/app_header.dart';
import '../widgets/app_footer.dart';

class ProductPageView extends StatelessWidget {
  const ProductPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProductViewModel>();
    final product = vm.products.isNotEmpty ? vm.products.first : null;

    return Scaffold(
      appBar: const AppHeader(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (product != null)
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.grey[200]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(product.imageUrl, fit: BoxFit.cover, errorBuilder: (c,e,s) {
                          return Container(color: Colors.grey[300], child: const Center(child: Icon(Icons.image_not_supported, size: 64, color: Colors.grey)));
                        }),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(product.name, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Text('£${product.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 24, color: Color(0xFF4d2963))),
                    const SizedBox(height: 24),
                    const Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    Text(product.description, style: const TextStyle(fontSize: 16, color: Colors.grey, height: 1.5)),
                  ],
                ),
              )
            else
              Container(padding: const EdgeInsets.all(24), child: vm.loading ? const CircularProgressIndicator() : const Text('No product')),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}