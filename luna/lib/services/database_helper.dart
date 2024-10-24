import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:luna/modelos/contato.dart'; // Ajuste o caminho se necessário

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    // Inicializa o banco de dados
    _database = await _initDB('contatos.db');
    return _database!;
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath(); // Obtém o caminho do banco de dados
    final path = join(dbPath, dbName); // Define o caminho completo do banco de dados

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE contatos(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            numero TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertContato(Contato contato) async {
    final db = await database;
    await db.insert('contatos', contato.toMap()); // Método toMap() no modelo Contato
  }

  Future<List<Contato>> obterContatos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('contatos');

    return List.generate(maps.length, (i) {
      return Contato(
        id: maps[i]['id'],
        nome: maps[i]['nome'],
        numero: maps[i]['numero'],
      );
    });
  }

  Future<void> deletContato(int id) async {
    final db = await database;
    await db.delete('contatos', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateContato(Contato contato) async {
  final db = await database;
  await db.update(
    'contatos',
    contato.toMap(), // Você precisará implementar o método toMap na classe Contato
    where: 'id = ?',
    whereArgs: [contato.id],
  );
}

}
