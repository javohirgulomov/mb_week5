import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: NameScreen()));
}

class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Enter Your Name')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Your name',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GreetingScreen(
                      name: nameController.text,
                    ),
                  ),
                );
              },
              child: const Text('Greet'),
            ),
          ],
        ),
      ),
    );
  }
}

class GreetingScreen extends StatelessWidget {
  final String name;

  const GreetingScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Greeting')),
      body: Center(
        child: Text(
          'Hello, $name!',
          style: const TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}