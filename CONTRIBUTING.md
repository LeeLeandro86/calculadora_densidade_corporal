# Contribuindo para o Projeto

Agradecemos interesse em contribuir! Este documento fornece diretrizes para contribuições.

## Código de Conduta

- Seja respeitoso
- Inclua referências científicas
- Teste suas mudanças
- Documente alterações

## Como Contribuir

### Reportar Bugs

1. Verifique se o bug já foi reportado
2. Descreva o comportamento esperado vs. observado
3. Forneça passos para reproduzir
4. Mencione versão do Flutter/Dart

### Sugerir Melhorias

1. Descreva o caso de uso
2. Explique o benefício
3. Exemplifique se possível

### Pull Requests

1. **Fork** o repositório
2. Crie uma branch (`git checkout -b feature/AmazingFeature`)
3. **Commit** suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. **Push** para a branch (`git push origin feature/AmazingFeature`)
5. Abra um **Pull Request**

## Padrões de Código

### Dart/Flutter
- Siga o [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use `flutter analyze` para validar
- Escreva testes para nova lógica
- Documente código complexo

### Commits
```
[FEATURE] Descrição curta
[BUGFIX] Descrição curta
[DOCS] Descrição curta
[TEST] Descrição curta
[REFACTOR] Descrição curta
```

### Nomes
- **Classes**: CamelCase (ex: `CustomNumberInput`)
- **Métodos**: camelCase (ex: `calcularDensidade`)
- **Constantes**: lowercase com underscore (ex: `ln10`)
- **Variáveis privadas**: _camelCase (ex: `_currentValue`)

## Estrutura de Diretórios

Ao adicionar novos arquivos:
- `lib/`: Código principal
- `lib/widgets/`: Componentes reutilizáveis
- `lib/models/`: Classes de dados
- `lib/services/`: Serviços (API, banco de dados)
- `test/`: Testes unitários e de widget

## Testando Mudanças

```bash
# Análise de código
flutter analyze

# Testes unitários
flutter test

# Run app
flutter run

# Build
flutter build apk
```

## Documentação

Ao adicionar features:
1. Atualize `README.md`
2. Adicione comentários no código
3. Atualize `PROJECT_SUMMARY.md` se necessário
4. Documente fórmulas em `FORMULAS.md`

## Referências Científicas

Ao implementar novos cálculos:
1. Use fontes confiáveis
2. Cite publicações científicas
3. Inclua margem de erro
4. Teste com valores conhecidos

### Fontes Recomendadas
- PubMed (pubmed.ncbi.nlm.nih.gov)
- Google Scholar (scholar.google.com)
- ResearchGate (researchgate.net)
- Artigos do ACMS

## Licença

Ao contribuir, você concorda que suas contribuições serão licenciadas sob a mesma licença do projeto.

## Dúvidas?

- Abra uma issue
- Consulte a documentação existente
- Entre em contato com os mantenedores

---

Obrigado por contribuir! 🎉
