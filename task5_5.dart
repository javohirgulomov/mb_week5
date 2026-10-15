```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: HomeScreen()));
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;

  FadeRoute(this.page)
      : super(
          transitionDuration: const Duration(milliseconds: 400),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
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
          onPressed: () {
            Navigator.push(
              context,
              FadeRoute(const DetailsScreen()),
            );
          },
          child: const Text('Open with fade'),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: const Center(
        child: Text('This screen fades in!'),
      ),
    );
  }
}
```