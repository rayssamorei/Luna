import 'package:flutter/material.dart';
import 'cadastro.dart'; // Importe a tela de cadastro
import 'inicial.dart'; // Importe a tela principal (TelaInicial)

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFcccccc), // Cor de fundo cinza
        child: Column(
          children: [
            // Container superior com o botão de voltar e o título, com bordas arredondadas
            Container(
              height: 100, // Aumente a altura do cabeçalho
              decoration: const BoxDecoration(
                color: Color(0xFF3B114B), // Cor do container
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40), // Bordas arredondadas no topo
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context); // Navega para a tela anterior
                    },
                  ),
                  const SizedBox(width: 16), // Espaço entre o botão e o texto
                  const Text(
                    'Faça seu login no Luna',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 100), // Aumente o espaçamento entre o cabeçalho e o formulário

            // Caixas de texto com bordas mais arredondadas
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0), // Bordas mais arredondadas
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16), // Espaçamento entre as caixas de texto
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0), // Bordas mais arredondadas
                        borderSide: BorderSide.none,
                      ),
                    ),
                    obscureText: true,
                  ),

                  const SizedBox(height: 40), // Espaçamento inferior antes dos botões

                  // Botão Entrar
                  ElevatedButton(
                    onPressed: () {
                      // Navega para a tela principal ao clicar em "Entrar"
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TelaInicial()), // Tela principal
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B114B), // Cor do botão
                      minimumSize: const Size(300, 50), // Largura do botão
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Bordas arredondadas
                      ),
                    ),
                    child: const Text(
                      'Entrar',
                      style: TextStyle(color: Colors.white), // Fonte branca
                    ),
                  ),

                  const SizedBox(height: 20), // Espaçamento entre os botões

                  // Texto entre os botões
                  const Text(
                    'Não tem conta?',
                    style: TextStyle(
                      color: Color(0xFF777777), // Cor do texto
                    ),
                  ),

                  const SizedBox(height: 20), // Espaçamento entre o texto e o botão de cadastro

                  // Botão Se cadastrar
                  ElevatedButton(
                    onPressed: () {
                      // Navega para a tela de cadastro
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegistrationPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B114B), // Cor do botão
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Aumenta o tamanho do botão
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Bordas arredondadas
                      ),
                    ),
                    child: const Text(
                      'Se cadastrar',
                      style: TextStyle(color: Colors.white), // Fonte branca
                    ),
                  ),

                  const SizedBox(height: 20), // Espaçamento inferior
                ],
              ),
            ),

            // Imagem na parte inferior
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity, // Ou um valor fixo como 300
                  child: Image.asset(
                    'assets/imagem2.png', // Caminho da sua imagem
                    fit: BoxFit.cover, // Ajusta a imagem para cobrir o espaço
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
