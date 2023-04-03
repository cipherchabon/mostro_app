// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mostro_app/routing.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            SizedBox(height: 32),
            Logo(),
            SizedBox(height: 64),
            KeyInputField(),
            SizedBox(height: 32),
            AuthButton(),
            Spacer(),
            GenerateNewKeyButton(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 150,
        maxHeight: 150,
      ),
      child: Placeholder(),
    );
  }
}

class KeyInputField extends StatelessWidget {
  const KeyInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'nsec / npub / hex private key',
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.goNamed(AppRoute.home.name);
      },
      child: Text('Sign in'),
    );
  }
}

class GenerateNewKeyButton extends StatelessWidget {
  const GenerateNewKeyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text('Generate a new key'),
    );
  }
}
