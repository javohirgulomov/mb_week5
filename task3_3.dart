import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phone;
  final String email;

  const Contact(this.name, this.phone, this.email);
}

const contacts = [
  Contact('Ali', '+998 90 111 2233', 'ali@gmail.com'),
  Contact('Madina', '+998 91 222 3344', 'madina@gmail.com'),
  Contact('Jasur', '+998 93 333 4455', 'jasur@gmail.com'),
  Contact('Aziza', '+998 94 444 5566', 'aziza@gmail.com'),
  Contact('Sardor', '+998 95 555 6677', 'sardor@gmail.com'),
];

void main() {
  runApp(const MaterialApp(home: ContactListScreen()));
}

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: ListView(
        children: [
          for (final contact in contacts)
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(contact.name),
              subtitle: Text(contact.phone),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ContactScreen(contact: contact),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  final Contact contact;

  const ContactScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact.name)),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    child: Text(
                      contact.name[0],
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Name: ${contact.name}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 12),
                Text(
                  'Phone: ${contact.phone}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 12),
                Text(
                  'Email: ${contact.email}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}