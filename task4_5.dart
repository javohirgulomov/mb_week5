```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/rate': (context) => const RateScreen(),
      },
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String movie = 'Inception';
  int? rating;

  Future<void> rateMovie() async {
    final result = await Navigator.pushNamed<int>(
      context,
      '/rate',
      arguments: movie,
    );

    setState(() {
      rating = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Rating')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              rating == null
                  ? 'Movie: $movie'
                  : 'Movie: ${rating}/5',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: rateMovie,
              child: const Text('Rate Movie'),
            ),
          ],
        ),
      ),
    );
  }
}

class RateScreen extends StatelessWidget {
  const RateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text('Rate $movie')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose your rating',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                final rating = index + 1;

                return IconButton(
                  onPressed: () {
                    Navigator.pop(context, rating);
                  },
                  icon: const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 35,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
```