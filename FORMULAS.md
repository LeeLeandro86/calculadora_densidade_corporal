# Documentação Técnica - Fórmulas de Cálculo

## 1. Jackson-Pollock (7 Dobras)

A fórmula de Jackson-Pollock utiliza 7 medidas de dobras cutâneas para calcular a densidade corporal:

### Dobras Medidas:
1. **Peitoral**
2. **Abdominal**
3. **Coxa**
4. **Tríceps**
5. **Subescapular**
6. **Axilar Média**
7. **Supra Ilíaca**

### Fórmula para Homens (7 dobras):
```
DB = 1.0970 - (0.46971 × log₁₀(X))
```

Onde X = soma das 7 dobras cutâneas (em mm)

### Fórmula para Mulheres (7 dobras):
```
DB = 1.06130 - (0.63130 × log₁₀(X))
```

Onde X = soma das 7 dobras cutâneas (em mm)

### Validação:
- Aplicável para idades 18-29 anos
- Margem de erro: ±3.5% para homens, ±3.0% para mulheres

---

## 2. Jackson-Pollock (3 Dobras)

Versão simplificada usando apenas 3 dobras:

### Dobras Medidas (conforme sexo):
- **Homens**: Peitoral, Abdominal, Coxa
- **Mulheres**: Peitoral, Abdominal, Coxa

### Fórmula para Homens (3 dobras):
```
DB = 1.10938 - (0.0008267 × X) + (0.0000016 × X²) - (0.0002574 × Idade)
```

Onde X = soma das 3 dobras cutâneas (em mm)

### Fórmula para Mulheres (3 dobras):
```
DB = 1.0994921 - (0.0009929 × X) + (0.0000023 × X²) - (0.0001392 × Idade)
```

Onde X = soma das 3 dobras cutâneas (em mm)

### Validação:
- Aplicável para idades 18-55 anos
- Margem de erro: ±3.7% para homens, ±3.8% para mulheres
- **Maior precisão**: Considera a idade no cálculo

---

## 3. Equação de Siri

Converte a densidade corporal em percentual de gordura corporal:

### Fórmula:
```
% Gordura = (495 / DB) - 450
```

Onde DB = Densidade Corporal (g/cm³)

### Características:
- Válida para faixas de gordura entre 3% e 50%
- Desenvolvida em 1956 por William E. Siri
- Amplamente utilizada em avaliações antropométricas
- Baseada em dados de cadáveres dissecados

### Limitações:
- Assume composição corporal constante
- Menos precisa em indivíduos extremos (muito magros ou obesos)

---

## 4. Classificação por Faixa Etária

### Homens com menos de 30 anos:
| Categoria | Percentual |
|-----------|-----------|
| Essencial | < 6% |
| Atleta | 6-13% |
| Fitness | 13-17% |
| Média | 17-25% |
| Acima da Média | > 25% |

### Mulheres com menos de 30 anos:
| Categoria | Percentual |
|-----------|-----------|
| Essencial | < 17% |
| Atleta | 17-24% |
| Fitness | 24-31% |
| Média | 31-38% |
| Acima da Média | > 38% |

### Homens 30-40 anos:
| Categoria | Percentual |
|-----------|-----------|
| Essencial | < 7% |
| Atleta | 7-14% |
| Fitness | 14-18% |
| Média | 18-26% |
| Acima da Média | > 26% |

### Mulheres 30-40 anos:
| Categoria | Percentual |
|-----------|-----------|
| Essencial | < 18% |
| Atleta | 18-25% |
| Fitness | 25-32% |
| Média | 32-39% |
| Acima da Média | > 39% |

### Homens acima de 40 anos:
| Categoria | Percentual |
|-----------|-----------|
| Essencial | < 8% |
| Atleta | 8-15% |
| Fitness | 15-19% |
| Média | 19-27% |
| Acima da Média | > 27% |

### Mulheres acima de 40 anos:
| Categoria | Percentual |
|-----------|-----------|
| Essencial | < 20% |
| Atleta | 20-27% |
| Fitness | 27-34% |
| Média | 34-41% |
| Acima da Média | > 41% |

---

## 5. Técnica de Medição (Recomendações)

Para garantir precisão:

1. **Local**: Todas as medidas devem ser feitas no lado direito do corpo
2. **Ponto de Coleta**: 1 cm abaixo do topo da dobra
3. **Compressão**: Usar adipômetro com pressão padronizada
4. **Múltiplas Medições**: Fazer 3 medições e calcular a média
5. **Posicionamento do Cliente**: Em pé, com pele exposta
6. **Tempo Entre Medições**: Esperar 15 segundos entre dobras

---

## 6. Referências Bibliográficas

Jackson, A. S., & Pollock, M. L. (1978). Generalized equations for predicting body density of women. Medicine & Science in Sports & Exercise, 12(3), 175-182.

Jackson, A. S., Pollock, M. L., & Ward, A. (1980). Generalized equations for predicting body density of men. British Journal of Nutrition, 40(3), 497-504.

Siri, W. E. (1956). The gross composition of the body. Advances in Biological and Medical Physics, 4, 239-280.

Roche, A. F., Heymsfield, S. B., & Lohman, T. G. (1996). Human body composition. Human Kinetics Publishers.

---

## 7. Notas Importantes

- **Precisão**: Estas fórmulas têm margem de erro de ±3-4%
- **Aplicabilidade**: Desenvolvidas para populações de etnias variadas (primariamente caucasiana)
- **Limitações**: Menos precisas em indivíduos muito obesos ou muito magros
- **Replicabilidade**: Resultado depende da precisão da medição das dobras cutâneas
- **Interpretação**: Os resultados devem ser interpretados por profissional qualificado
