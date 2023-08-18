import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'presentation/providers/cat_breeds_provider.dart';
import 'presentation/screens/splash_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CatBreedsProvider(), // Inicializa el provider aquí
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cats breeds',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(), // Muestra el splash screen primero
    );
  }
}
