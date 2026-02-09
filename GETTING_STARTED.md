# Como Executar o Projeto

## Pré-requisitos

Certifique-se de ter instalado:
- Flutter SDK 3.0.0 ou superior
- Dart 3.0.0 ou superior
- Um dispositivo ou emulador Android/iOS configurado

## Passos para Executar

### 1. Instalar dependências
```bash
flutter pub get
```

### 2. Executar o aplicativo
```bash
flutter run
```

### 3. Executar em modo release (opcional)
```bash
flutter run --release
```

## Estrutura do Projeto

```
calculadora_densidade_corporal/
├── lib/
│   ├── main.dart                 # Arquivo principal e UI
│   ├── calculator.dart           # Lógica de cálculo
│   └── widgets/
│       ├── custom_number_input.dart  # Widget para campos numéricos
│       └── resultado_modal.dart      # Modal com resultado
├── pubspec.yaml                  # Configuração do projeto
├── analysis_options.yaml         # Configuração de análise de código
└── README.md                     # Este arquivo
```

## Funcionalidades

### Campos de Entrada
- **Idade**: 10-100 anos
- **Peso**: 20-300 kg
- **7 Dobras Cutâneas**: 0-100 mm cada

### Cálculos Implementados
- **Jackson-Pollock (7 dobras)**: Cálculo de densidade corporal para homens e mulheres
- **Equação de Siri**: Conversão de densidade em percentual de gordura
- **Classificação**: Baseada em faixas etárias e sexo

### Interface
- **Dark Mode**: Tema preto com acentos em ciano (#00D9FF)
- **Radio Buttons**: Para seleção de sexo e modo de cálculo
- **Incremento/Decremento**: Botões para ajuste de valores
- **Modal de Resultado**: Exibição clara dos cálculos

## Validações

- Valores numéricos são validados ao serem inseridos
- Limites mínimos e máximos são respeitados
- A classificação varia conforme idade e sexo

## Suporte Técnico

Para dúvidas sobre as fórmulas utilizadas:
- Jackson-Pollock, W. C. (1978). Generalized equations for predicting body density of women.
- Siri, W. E. (1956). The gross composition of the body.
