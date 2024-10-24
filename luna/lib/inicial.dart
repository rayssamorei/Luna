import 'package:flutter/material.dart';
import 'package:luna/sobre.dart'; // Certifique-se de que a 'SobrePage' está neste arquivo ou importada corretamente
import 'contatos.dart'; // Importe o arquivo onde a TelaContatos está definida
import 'conf.dart';

void main() {
  runApp(const MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: const Color(0xFF3B114B)),
      home: const TelaInicial(),
    );
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  int _currentIndex = 0;

  static const Color primaryColor = Color(0xFF3B114B);
  static const Color backgroundColor = Color(0xFFCCCCCC);
  static const TextStyle titleTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 35,
    fontWeight: FontWeight.bold,
    fontFamily: 'AbrilFatface',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          _buildHeader(context),
          _buildMainContent(),
          _buildSeparator(),
          _buildNewsList(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 9,
            right: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/imagem2.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            top: 27,
            right: 15,
            child: Icon(Icons.bedtime_rounded, color: Colors.white, size: 50),
          ),
          Positioned(
            left: 10,
            top: 30,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 30,
            right: 80,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SobreScreen()),
                );
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/sobre.png'),
                radius: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          Positioned(
            top: 165,
            left: 20,
            right: 80,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const Positioned(
            top: 195,
            left: 40,
            child: Text(
              'Sinta-se em\nSEGURANÇA!',
              style: titleTextStyle,
              textAlign: TextAlign.left,
            ),
          ),
          Positioned(
            top: 30,
            left: 170,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/mulher.png',
                height: 400,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeparator() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 10,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
    );
  }

  Widget _buildNewsList() {
    final List<Map<String, String>> news = [
      {
        'image': 'assets/noticia1.jpg',
        'title': 'Forças de Segurança capturam 330 suspeitos de violência...',
        'date': '3 de setembro de 2024 - 15:06',
      },
      {
        'image': 'assets/noticia2.jpg',
        'title': 'Ceará alcança redução de 75% nos feminicídios...',
        'date': 'Agosto de 2024',
      },
      {
        'image': 'assets/noticia3.jpg',
        'title': '18 anos da Lei Maria da Penha: operações...',
        'date': 'Setembro de 2024',
      },
    ];

    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemCount: news.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(news[index]['image']!, width: 90),
              ),
              title: Text(
                news[index]['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(news[index]['date']!),
            ),
          );
        },
      ),
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
        color: primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      padding: const EdgeInsets.all(5),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;

            // Navegação para a tela de contatos
            if (_currentIndex == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TelaContatos()), // Navegação para a tela de contatos
              );
            } else if (_currentIndex == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ConfiguracoesScreen()),
              );
            }
          });
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
