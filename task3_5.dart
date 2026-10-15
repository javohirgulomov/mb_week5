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
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  Future<void> editCounter() async {
    final result = await Navigator.push<int>(
      context,
      MaterialPageRoute(
        builder: (context) => EditorScreen(value: counter),
      ),
    );

    if (result != null) {
      setState(() {
        counter = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter: $counter',
              style: const TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: editCounter,
              child: const Text('Edit counter'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditorScreen extends StatefulWidget {
  final int value;

  const EditorScreen({super.key, required this.value});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  late int editedValue;

  @override
  void initState() {
    super.initState();
    editedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$editedValue',
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      editedValue++;
                    });
                  },
                  child: const Text('+'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      editedValue--;
                    });
                  },
                  child: const Text('-'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, editedValue);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}