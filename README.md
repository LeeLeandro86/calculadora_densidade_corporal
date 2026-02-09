# Calculadora de Densidade Corporal

Um aplicativo Flutter moderno para cálculo de densidade corporal e percentual de gordura corporal usando a fórmula de Jackson-Pollock e equação de Siri.

## Características

- **Interface Dark Mode**: Design moderno com fundo preto sólido (#121214)
- **Dois Modos de Cálculo**: 
  - 3 dobras (Peitoral, Abdominal, Coxa)
  - 7 dobras (Peitoral, Abdominal, Coxa, Tríceps, Subescapular, Axilar Média, Supra Ilíaca)
- **Suporte para Ambos os Sexos**: Cálculos específicos por gênero
- **Campos com Incremento/Decremento**: Controles intuitivos para entrada de dados
- **Resultado em Modal**: Exibição clara do percentual de gordura corporal

## Fórmulas Utilizadas

### Jackson-Pollock (7 Dobras)
Densidade corporal calculada usando equação específica por sexo:
- **Homens**: DB = 1.0970 - (0.46971 × log10(X)) 
- **Mulheres**: DB = 1.06130 - (0.63130 × log10(X))

Onde X é a soma de 7 dobras cutâneas.

### Equação de Siri
Percentual de Gordura = ((495 / DB) - 450)

## Instalação

1. Clone o repositório
2. Execute `flutter pub get`
3. Execute `flutter run`

## Requisitos do Sistema

- Flutter SDK 3.0.0 ou superior
- Dart 3.0.0 ou superior
