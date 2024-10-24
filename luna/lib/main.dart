import 'package:flutter/material.dart';
// import 'cadastro.dart'; // Importe a tela de cadastro
import 'login.dart'; // Importe a tela de login

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(), // Tela inicial
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF3b114b), // Cor de fundo roxo escuro
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Navega para a tela de login ao clicar
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/imagemlogo.png'), // Substitua pelo caminho da sua logo
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Luna',
                style: TextStyle(
                  fontFamily: 'NotoSerifGeorgian',
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Um aplicativo que tem como missão transmitir segurança a suas usuárias.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF777777),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
