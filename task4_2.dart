```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/square': (context) => const SquareScreen(),
      },
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
                Navigator.pushNamed(
                  context,
                  '/square',
                  arguments: 1,
                );
              },
              child: const Text('1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/square',
                  arguments: 2,
                );
              },
              child: const Text('2'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/square',
                  arguments: 3,
                );
              },
              child: const Text('3'),
            ),
          ],
        ),
      ),
    );
  }
}

class SquareScreen extends StatelessWidget {
  const SquareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final number = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(title: const Text('Square')),
      body: Center(
        child: Text(
          'Number: $number\nSquare: ${number * number}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
```