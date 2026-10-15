```dart
import 'package:flutter/material.dart';

class User {
  final String name;
  final int age;
  final String city;

  const User(this.name, this.age, this.city);
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<User> users = const [
    User('Ali', 20, 'Tashkent'),
    User('Sara', 22, 'Samarkand'),
    User('John', 19, 'Bukhara'),
    User('Madina', 21, 'Andijan'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(user.name),
            subtitle: Text('${user.age} years old'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/profile',
                arguments: user,
              );
            },
          );
        },
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_circle, size: 80),
            const SizedBox(height: 20),
            Text(
              'Name: ${user.name}',
              style: const TextStyle(fontSize: 22),
            ),
            Text(
              'Age: ${user.age}',
              style: const TextStyle(fontSize: 22),
            ),
            Text(
              'City: ${user.city}',
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
```