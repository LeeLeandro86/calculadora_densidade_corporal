// Entidade simples que representa o resultado final do cálculo.
// Mantém apenas os dados que as camadas superiores (UI) precisam exibir.
class ResultadoCalculo {
  final double percentualGordura;
  final double densidade;
  final String classificacao;

  ResultadoCalculo({
    required this.percentualGordura,
    required this.densidade,
    required this.classificacao,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultadoCalculo &&
          runtimeType == other.runtimeType &&
          percentualGordura == other.percentualGordura &&
          densidade == other.densidade &&
          classificacao == other.classificacao;

  @override
  int get hashCode =>
      percentualGordura.hashCode ^ densidade.hashCode ^ classificacao.hashCode;

  @override
  String toString() =>
      'ResultadoCalculo(percentualGordura: $percentualGordura, densidade: $densidade, classificacao: $classificacao)';
}
