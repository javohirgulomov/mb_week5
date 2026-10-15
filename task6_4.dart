import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => const NotFoundScreen(),
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/item/:id',
      name: 'item',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return ItemScreen(id: id);
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
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.goNamed('settings');
              },
              child: const Text('Go to Settings'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                context.goNamed(
                  'item',
                  pathParameters: {'id': '42'},
                );
              },
              child: const Text('Open Item 42'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                context.go('/unknown');
              },
              child: const Text('Test 404 Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.goNamed('home');
          },
          child: const Text('Back to Home'),
        ),
      ),
    );
  }
}

class ItemScreen extends StatelessWidget {
  final String id;

  const ItemScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Item')),
      body: Center(
        child: Text(
          'Item ID: $id',
          style: const TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('404')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 80),
            const SizedBox(height: 16),
            const Text(
              'Page not found',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.goNamed('home');
              },
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}