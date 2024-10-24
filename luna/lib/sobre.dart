import 'package:flutter/material.dart';

class SobreScreen extends StatefulWidget {
  const SobreScreen({super.key});

  @override
  _SobreScreenState createState() => _SobreScreenState();
}

class _SobreScreenState extends State<SobreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFEEEEEE), // Cor de fundo cinza
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Cabeçalho com botão de voltar
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF3B114B), // Cor de fundo roxa
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18.0),
                    bottomRight: Radius.circular(18.0),
                  ), // Borda arredondada nas laterais inferiores
                ),
                padding: const EdgeInsets.only(
                    top: 20.0, left: 16.0, right: 16.0, bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white, // Cor do ícone branca
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text(
                      'Sobre',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                        width: 48), // Espaço para equilibrar o ícone de voltar
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Seção: O que é o Luna?
                    Text(
                      '• O que é o Luna?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        color: Color(0xFF3B114B), // Cor roxa do texto
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'O Projeto Luna é um aplicativo inovador voltado para a segurança das mulheres no Ceará, integrando-se a smartwatches e smartphones para responder rapidamente em situações de risco. Em um estado onde a violência contra a mulher é uma preocupação crescente, o Luna oferece uma solução tecnológica que detecta alterações nos batimentos cardíacos e pressão arterial, permitindo que as usuárias acionem alertas discretos para contatos de confiança ou autoridades em caso de emergência.\n\nAlém de monitoramento contínuo e alertas de emergência, o Projeto Luna assegura a privacidade e a segurança dos dados das usuárias, com informações armazenadas de forma segura e compartilhadas apenas com os contatos designados. O aplicativo é intuitivo e acessível, mesmo para quem tem pouca experiência com tecnologia, facilitando seu uso em situações de alta tensão.',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 16.0),
                    Divider(
                        color: Colors.white,
                        thickness: 10), // Divider between sections

                    // Seção: Contato
                    Text(
                      '• Contato:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        color: Color(0xFF3B114B), // Cor roxa do texto
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Email: projetolunaapp@gmail.com\nTelefone: (88) 98824-4753\nRedes Sociais: @luna.appce',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 16.0),
                    Divider(
                        color: Colors.white,
                        thickness: 10), // Divider between sections

                    // Seção: Desenvolvedores Luna
                    Text(
                      '• Desenvolvedores Luna:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        color: Color(0xFF3B114B), // Cor roxa do texto
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Rayssa Alves\nJennyfer Alves\nKauan Alves\nAna Ruth Lacerda',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),

              // Rodapé com decoração (flores)
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF3B114B),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18.0),
                    topRight: Radius.circular(18.0),
                  ),
                ),
                padding: const EdgeInsets.all(0.0), // Removi o padding para maximizar o uso do espaço
                child: Image.asset(
                  'assets/imagem2.png', // Caminho para sua imagem
                  fit: BoxFit.cover, // Garante que a imagem cubra toda a área do container
                  width: double.infinity, // Preenche toda a largura
                  height: 70.0, // Defina uma altura específica se quiser controlar o tamanho
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
