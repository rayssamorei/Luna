import 'package:flutter/material.dart';
import 'contatos.dart';
import 'inicial.dart';

void main() {
  runApp(const ConfiguracoesApp());
}

class ConfiguracoesApp extends StatelessWidget {
  const ConfiguracoesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luna App Configurações',
      theme: ThemeData(
        primaryColor: const Color(0xFF3B114B), // Cor roxa do tema
      ),
      home: const ConfiguracoesScreen(),
    );
  }
}

class ConfiguracoesScreen extends StatefulWidget {
  const ConfiguracoesScreen({super.key});

  @override
  _ConfiguracoesScreenState createState() => _ConfiguracoesScreenState();
}

class _ConfiguracoesScreenState extends State<ConfiguracoesScreen> {
  int _currentIndex = 2; // Atualize para o índice da aba "Configurações"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE), // Cor de fundo cinza
      body: Column(
        children: [
          // Cabeçalho
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF3B114B), // Cor de fundo roxa
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18.0),
                bottomRight: Radius.circular(18.0),
              ), // Borda arredondada nas laterais inferiores
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
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
                  'Configurações',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                    width: 48), // Para balancear o espaço com o ícone de voltar
              ],
            ),
          ),

          // Conteúdo principal
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20.0),

                  // Ícone de alerta
                  const Icon(
                    Icons.alarm_on_rounded,
                    size: 100,
                    color: Color(0xFF3B114B), // Cor roxa
                  ),

                  const SizedBox(height: 20.0),

                  // Texto descritivo
                  const Text(
                    'Aqui você pode configurar o seu botão de emergência para situações de perigo. '
                    'Ao acionar o botão pela 1ª vez, será enviada uma mensagem via SMS aos seus contatos favoritos. '
                    'Ao acionar na segunda vez, será feita uma ligação aos contatos e à polícia para te ajudar o mais rápido possível e te manter segura.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16.0),
                  ),

                  const SizedBox(height: 40.0),

                  // Texto de título "Configurações disponíveis"
                  const Text(
                    'Configurações disponíveis:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Color(0xFF3B114B),
                    ),
                  ),

                  const SizedBox(height: 20.0),

                  // Botões de controle
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              255, 254, 254, 254), // Cor de fundo do retângulo
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.volume_up, size: 30),
                            SizedBox(width: 10),
                            Text('Som'),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              255, 255, 255, 255), // Cor de fundo do retângulo
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.power_settings_new, size: 30),
                            SizedBox(width: 10),
                            Text('Desligar'),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20.0),

                  // Informação adicional sobre os botões
                  const Text(
                    'Ao clicar nesses botões o seu alarme será acionado!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    const items = [
      {'icon': 'assets/home.png', 'label': 'Início'},
      {'icon': 'assets/contatos.png', 'label': 'Contatos'},
      {'icon': 'assets/conf.png', 'label': 'Configurações'},
    ];

    return Container(
      
      decoration: const BoxDecoration(
        color: Color(0xFF3B114B), // Usando a mesma cor de fundo da página
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      padding: const EdgeInsets.all(5),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent, // Mantendo o fundo transparente
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Navegação para a tela de contatos
          if (_currentIndex == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const TelaInicial()), // Navegação para a tela inicial
            );
          } else if (_currentIndex == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TelaContatos()), // Navegação para a tela de contatos
            );
          }
        },
        items: items
            .map(
              (item) => BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(item['icon']!), color: Colors.white),
                label: item['label'],
              ),
            )
            .toList(),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
