import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: ElevatedButton(
        onPressed: FirebaseAuth.instance.signOut,
        child: const Text('Log-out'),
      ),
    );
  }
}
