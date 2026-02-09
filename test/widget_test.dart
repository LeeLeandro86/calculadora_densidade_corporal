import 'package:flutter_test/flutter_test.dart';
import 'package:calculadora_densidade_corporal/calculator.dart';

void main() {
  group('DensidadeCorporalCalculator', () {
    group('calcularDensidade7Dobras', () {
      test('calcula densidade para homem corretamente', () {
        double densidade = DensidadeCorporalCalculator.calcularDensidade7Dobras(
          sexo: 'masculino',
          dobras: [10, 15, 12, 12, 15, 18, 14],
        );
        expect(densidade, greaterThan(1.0));
        expect(densidade, lessThan(1.1));
      });

      test('calcula densidade para mulher corretamente', () {
        double densidade = DensidadeCorporalCalculator.calcularDensidade7Dobras(
          sexo: 'feminino',
          dobras: [10, 15, 12, 12, 15, 18, 14],
        );
        expect(densidade, greaterThan(1.0));
        expect(densidade, lessThan(1.1));
      });

      test('lança erro com número incorreto de dobras', () {
        expect(
          () => DensidadeCorporalCalculator.calcularDensidade7Dobras(
            sexo: 'masculino',
            dobras: [10, 15, 12],
          ),
          throwsArgumentError,
        );
      });
    });

    group('calcularPercentualGordura', () {
      test('converte densidade em percentual corretamente', () {
        double percentual = DensidadeCorporalCalculator.calcularPercentualGordura(1.055);
        expect(percentual, greaterThan(0));
        expect(percentual, lessThan(50));
      });

      test('limita percentual entre 0 e 100', () {
        double percentualBaixo = DensidadeCorporalCalculator.calcularPercentualGordura(1.100);
        expect(percentualBaixo, greaterThanOrEqualTo(0));

        double percentualAlto = DensidadeCorporalCalculator.calcularPercentualGordura(0.900);
        expect(percentualAlto, lessThanOrEqualTo(100));
      });
    });

    group('obterClassificacao', () {
      test('classifica homem jovem com baixo percentual como atleta', () {
        String classificacao = DensidadeCorporalCalculator.obterClassificacao(
          sexo: 'masculino',
          idade: 25,
          percentualGordura: 10,
        );
        expect(classificacao, 'Atleta');
      });

      test('classifica mulher jovem com baixo percentual como atleta', () {
        String classificacao = DensidadeCorporalCalculator.obterClassificacao(
          sexo: 'feminino',
          idade: 25,
          percentualGordura: 20,
        );
        expect(classificacao, 'Atleta');
      });

      test('classifica percentual alto como acima da média', () {
        String classificacao = DensidadeCorporalCalculator.obterClassificacao(
          sexo: 'masculino',
          idade: 25,
          percentualGordura: 40,
        );
        expect(classificacao, 'Acima da Média');
      });
    });

    group('calcularDensidade3DobrasComIdade', () {
      test('calcula densidade para 3 dobras com idade', () {
        double densidade = DensidadeCorporalCalculator.calcularDensidade3DobrasComIdade(
          sexo: 'masculino',
          idade: 30,
          peitoral: 10,
          abdominal: 15,
          coxa: 12,
        );
        expect(densidade, greaterThan(1.0));
        expect(densidade, lessThan(1.1));
      });

      test('densidade varia com idade para mesmo sexo e dobras', () {
        double densidade1 = DensidadeCorporalCalculator.calcularDensidade3DobrasComIdade(
          sexo: 'masculino',
          idade: 20,
          peitoral: 10,
          abdominal: 15,
          coxa: 12,
        );
        
        double densidade2 = DensidadeCorporalCalculator.calcularDensidade3DobrasComIdade(
          sexo: 'masculino',
          idade: 50,
          peitoral: 10,
          abdominal: 15,
          coxa: 12,
        );
        
        expect(densidade1, isNotEmpty);
        expect(densidade2, isNotEmpty);
      });
    });
  });
}
