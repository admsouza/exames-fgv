# exames-fgv

Base de conhecimento para preparação em provas da FGV, com foco em concursos de Tecnologia da Informação.

## Objetivo

Transformar cada questão resolvida em dado útil para responder três perguntas:

1. Em quais assuntos estou forte?
2. Onde estou perdendo pontos e por quê?
3. O que devo estudar agora para maximizar minha pontuação?

O repositório não deve ser apenas um arquivo de provas. Ele registra desempenho, confiança, tempo, causas dos erros e evolução por tema.

## Estrutura

```text
exames-fgv/
├── README.md
├── provas/                  # cadernos, gabaritos e metadados das provas estudadas
├── desempenho/
│   ├── questoes.jsonl       # histórico individual das questões
│   ├── questoes.schema.json # contrato dos registros
│   ├── simulados.jsonl      # resultados de simulados completos
│   └── discursivas.jsonl    # histórico e notas de discursivas
├── estudos/
│   ├── caderno-de-erros.md
│   └── pontos-fracos.md
└── docs/
    ├── metodologia.md
    └── taxonomia-assuntos.md
```

## Registro de uma questão

Cada linha de `desempenho/questoes.jsonl` representa uma resolução.

Exemplo:

```json
{"id":"tjrj-2026-analista-sistemas-q55-2026-11-02","data":"2026-11-02","prova":"TJRJ 2026","orgao":"TJRJ","ano":2026,"cargo":"Analista de Sistemas","questao":55,"disciplina":"Tecnologia da Informação","assunto":"Programação","subassunto":"Java/Spring Boot","resposta_usuario":"B","gabarito":"C","resultado":"erro","confianca":"media","tempo_segundos":92,"tipo_erro":"distrator","alternativas_duvida":["B","C"],"justificativa_correta":"getOrDefault retorna o valor padrão quando a chave não existe.","motivo_erro":"Confusão sobre o comportamento de Map.getOrDefault.","observacao":"Fiquei entre B e C.","revisar":true,"revisao_em":"2026-11-05","fonte":"FGV"}
```

## Tipos de erro

- `conteudo`: não sabia o conceito necessário;
- `interpretacao`: sabia o conteúdo, mas interpretou incorretamente o enunciado;
- `distrator`: caiu em alternativa plausível ou ficou entre duas;
- `atencao`: erro de leitura, comando, marcação ou descuido.

## Nível de confiança

- `alta`: resposta segura;
- `media`: dúvida relevante;
- `baixa`: tentativa, eliminação parcial ou chute.

Acerto com confiança baixa deve ser tratado como sinal de fragilidade, não como domínio consolidado.

## Método de resolução

Usaremos o protocolo **JEF-2**:

1. **Julgue** exatamente o comando da questão.
2. **Elimine** alternativas por erro técnico objetivo.
3. **Fundamente** a resposta antes de marcar.
4. Quando sobrarem **2 alternativas**, procure o fato técnico que as diferencia.

Veja os detalhes em [`docs/metodologia.md`](docs/metodologia.md).

## Como definir o próximo estudo

A prioridade não será baseada apenas no edital. Deve cruzar:

- incidência do assunto em provas FGV relevantes;
- peso no edital atual;
- percentual de acertos;
- tipo e reincidência dos erros;
- nível de confiança;
- proximidade da prova.

Assim, assuntos já dominados recebem menos tempo e os pontos fracos com maior retorno potencial recebem prioridade.

## Fonte oficial

Sempre que possível, cadernos de questões e gabaritos devem vir da própria FGV. Cada prova adicionada deve conservar informações suficientes para rastrear sua fonte e seu gabarito oficial.
