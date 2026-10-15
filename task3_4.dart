import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColorScreen(),
    );
  }
}

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  Color currentColor = Colors.blue;

  Future<void> chooseColor() async {
    final c = await Navigator.push<Color>(
      context,
      MaterialPageRoute(
        builder: (context) => const ChooseColorScreen(),
      ),
    );

    if (c != null) {
      setState(() {
        currentColor = c;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose a Colour')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              color: currentColor,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: chooseColor,
              child: const Text('Choose colour'),
            ),
          ],
        ),
      ),
    );
  }
}

class ChooseColorScreen extends StatelessWidget {
  const ChooseColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select a Colour')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context, Colors.red);
              },
              child: const Text('Red'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context, Colors.green);
              },
              child: const Text('Green'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context, Colors.orange);
              },
              child: const Text('Orange'),
            ),
          ],
        ),
      ),
    );
  }
}