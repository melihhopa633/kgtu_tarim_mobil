import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../auth/login/providers/login_provider.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoşgeldiniz'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await loginProvider.logout();
              if (context.mounted) {
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Başarıyla giriş yaptınız!',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}