import 'package:flutter/material.dart';
import 'login.dart'; // Importe a tela de login

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>(); // Chave do formulário

    return Scaffold(
      body: Container(
        color: const Color(0xFFCCCCCC), // Cor de fundo cinza
        child: SingleChildScrollView( // Adicionando o SingleChildScrollView
          child: Column(
            children: [
              Container(
                height: 80, // Tamanho menor do container superior
                width: double.infinity, // Preenche toda a largura
                decoration: const BoxDecoration(
                  color: Color(0xFF3B114B), // Cor de fundo roxa
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)), // Cantos arredondados
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 30, // Alinha o botão no topo
                      left: 10, // Alinha o botão à esquerda
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.of(context).pop(); // Volta para a tela anterior
                        },
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Cadastre sua conta',
                        style: TextStyle(
                          fontSize: 18, // Tamanho menor do texto
                          color: Colors.white, // Cor do texto branco
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20), // Espaço após o container superior

              // Texto "Olá" e "Faça seu cadastro" alinhado à esquerda
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Alinha à esquerda
                  children: [
                    Text(
                      'Olá',
                      style: TextStyle(
                        fontSize: 32, // Fonte grande para "Olá"
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10), // Espaço entre os textos
                    Text(
                      'Faça seu cadastro no nosso aplicativo',
                      style: TextStyle(
                        fontSize: 18, // Fonte menor para "Faça seu cadastro"
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30), // Espaço maior antes do formulário

              // Formulário
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey, // Chave para validação
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Seu nome',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0), // Mais arredondado
                            borderSide: BorderSide.none, // Sem bordas
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo é obrigatório'; // Validação
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25), // Espaço maior entre as caixas
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Seu email',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0), // Mais arredondado
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo é obrigatório'; // Validação
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Sua senha',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0), // Mais arredondado
                            borderSide: BorderSide.none,
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo é obrigatório'; // Validação
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Confirme senha',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0), // Mais arredondado
                            borderSide: BorderSide.none,
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo é obrigatório'; // Validação
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30), // Espaço antes do botão

                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Validação do formulário
                            // Ação ao finalizar cadastro
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B114B), // Cor do botão
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Aumenta o tamanho do botão
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Finalizar cadastro',
                          style: TextStyle(color: Colors.white), // Fonte branca
                        ),
                      ),
                      const SizedBox(height: 20), // Espaço após o botão

                      // Texto com navegação para tela de login
                      GestureDetector(
                        onTap: () {
                          // Navega para a tela de login
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage()),
                          );
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: 'Já tem uma conta? ',
                            style: TextStyle(color: Color(0xFF777777), fontSize: 16), // Cor cinza
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Faça Login!',
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), // Cor preta
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 35), // Espaço antes da imagem
                    ],
                  ),
                ),
              ),

              // Adicionando a imagem no final da tela com o mesmo tamanho da de login
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity, // Preenche toda a largura
                  child: Image.asset(
                    'assets/imagem2.png', // Caminho da sua imagem
                    height: 100, // Ajuste de tamanho
                    fit: BoxFit.cover, // Para cobrir o espaço adequadamente
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
