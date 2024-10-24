import 'package:flutter/material.dart';
import 'services/database_helper.dart'; // Ajuste o caminho se necessário
import 'modelos/contato.dart'; // Ajuste o caminho se necessário
import 'conf.dart'; // Certifique-se de que o 'primaryColor' está definido aqui
import 'inicial.dart'; // Certifique-se de que a classe TelaInicial está definida aqui


class TelaContatos extends StatefulWidget {
  const TelaContatos({super.key});

  @override
  _TelaContatosState createState() => _TelaContatosState();
}
  const Color primaryColor = Color(0xFF3B114B);

class _TelaContatosState extends State<TelaContatos> {
  final List<Contato> _contatos = []; // Lista de Contato
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final DatabaseHelper _dbHelper = DatabaseHelper(); // Instância do DatabaseHelper
  int _currentIndex = 0; // Índice atual do BottomNavigationBar

  @override
  void initState() {
    super.initState();
    _carregarContatos(); // Carregar contatos ao iniciar a tela
  }

  Future<void> _carregarContatos() async {
    final contatos = await _dbHelper.obterContatos();
    setState(() {
      _contatos.clear(); // Limpa a lista antes de adicionar novos contatos
      _contatos.addAll(contatos); // Adicionar contatos à lista
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCCCCCC), // Fundo cinza
      appBar: AppBar(
        title: const Text(
          'Contatos',
          style: TextStyle(color: Colors.white), // Cor do texto para branca
        ),
        backgroundColor: const Color(0xFF3B114B), // Cabeçalho roxo
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30), // Bordas arredondadas
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Seta de voltar branca
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildContatoForm(),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft, // Alinhamento à esquerda
              child: Text(
                'Contatos',
                style: TextStyle(
                  fontSize: 24, // Tamanho da fonte
                  fontWeight: FontWeight.bold, // Negrito
                  color: Color(0xFF3B114B), // Cor do texto roxo
                ),
              ),
            ),
            const SizedBox(height: 10), // Espaço entre o título e a lista
            _buildContatoList(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildContatoForm() {
    return Column(
      children: [
        TextField(
          controller: _nomeController,
          decoration: InputDecoration(
            hintText: 'Nome',
            filled: true,
            fillColor: Colors.white, // Campo de texto branco
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), // Bordas arredondadas
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _numeroController,
          keyboardType: TextInputType.phone, // Tipo de entrada para telefone
          decoration: InputDecoration(
            hintText: 'Número',
            filled: true,
            fillColor: Colors.white, // Campo de texto branco
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), // Bordas arredondadas
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            _adicionarContato();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3B114B), // Botão roxo
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Bordas arredondadas
            ),
          ),
          child: const Text(
            'Adicionar',
            style: TextStyle(color: Colors.white), // Fonte branca
          ),
        ),
      ],
    );
  }

  Future<void> _adicionarContato() async {
    final nome = _nomeController.text;
    final numero = _numeroController.text;

    if (nome.isNotEmpty && numero.isNotEmpty) {
      final contato = Contato(nome: nome, numero: numero);
      await _dbHelper.insertContato(contato); // Adiciona ao banco de dados
      _nomeController.clear();
      _numeroController.clear();
      _carregarContatos(); // Atualiza a lista de contatos
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos.')),
      );
    }
  }

  Widget _buildContatoList() {
    return Expanded(
      child: ListView(
        children: [
          ..._contatos.where((c) => c.isFavorito).map((contato) {
            return _buildContatoTile(contato);
          }).toList(),
          ..._contatos.where((c) => !c.isFavorito).map((contato) {
            return _buildContatoTile(contato);
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildContatoTile(Contato contato) {
    return ListTile(
      title: Text(contato.nome),
      subtitle: Text(contato.numero),
      trailing: IconButton(
        icon: Icon(
          contato.isFavorito ? Icons.star : Icons.star_border,
          color: contato.isFavorito ? const Color(0xFF3B114B) : null,
        ),
        onPressed: () {
          setState(() {
            contato.isFavorito = !contato.isFavorito; // Alterna o estado de favorito
          });
          _dbHelper.updateContato(contato); // Atualiza o banco de dados
        },
      ),
      onLongPress: () {
        _deletarContato(contato.id!);
      },
    );
  }

  Future<void> _deletarContato(int id) async {
    await _dbHelper.deletContato(id); // Remove do banco de dados
    _carregarContatos(); // Atualiza a lista de contatos
  }

  Widget _buildBottomNavigationBar() {
    const items = [
      {'icon': 'assets/home.png', 'label': 'Início'},
      {'icon': 'assets/contatos.png', 'label': 'Contatos'},
      {'icon': 'assets/conf.png', 'label': 'Configurações'},
    ];

    return Container(
      decoration: const BoxDecoration(
        color: primaryColor, // Verifique se 'primaryColor' está definido em 'conf.dart'
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
            if (_currentIndex == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TelaInicial()), // Navegação para a tela inicial
              );
            } else if (_currentIndex == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ConfiguracoesScreen()), // Navegação para configurações
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
