import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Product {
  final String name;
  final double price;

  const Product(this.name, this.price);
}

final List<Product> products = const [
  Product('Laptop', 999.99),
  Product('Phone', 599.99),
  Product('Headphones', 89.99),
];

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/product-details',
      builder: (context, state) {
        final product = state.extra as Product;
        return ProductScreen(product: product);
      },
    ),
  ],
);

void main() {
  runApp(
    MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              context.push(
                '/product-details',
                extra: product,
              );
            },
          );
        },
      ),
    );
  }
}

class ProductScreen extends StatelessWidget {
  final Product product;

  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_bag, size: 80),
            const SizedBox(height: 20),
            Text(
              product.name,
              style: const TextStyle(fontSize: 26),
            ),
            const SizedBox(height: 10),
            Text(
              'Price: \$${product.price}',
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}