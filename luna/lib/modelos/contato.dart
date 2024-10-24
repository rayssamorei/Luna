class Contato {
  final int? id;
  final String nome;
  final String numero;
  bool isFavorito; // Nova propriedade para favoritos

  Contato({this.id, required this.nome, required this.numero,this.isFavorito = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'numero': numero,
      'isFavorito': isFavorito ? 1 : 0, // Converte booleano para int
    };
  }
}
