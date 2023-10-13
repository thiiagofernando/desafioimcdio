// ignore_for_file: public_member_api_docs, sort_constructors_first
class Pessoa {
  String nome;
  String peso;
  String altura;
  Pessoa({
    required this.nome,
    required this.peso,
    required this.altura,
  });

  @override
  String toString() => 'Nome: $nome, Peso: $peso, Altura: $altura : ';
}
