import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: const HomeScreen(),
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const NotFoundScreen(),
      ),
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
        child: ElevatedButton(
          child: const Text('Open Unknown Route'),
          onPressed: () {
            Navigator.pushNamed(context, '/does-not-exist');
          },
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
      appBar: AppBar(title: const Text('404 - Page Not Found')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 80,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            const Text(
              '404 - Page Not Found',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}