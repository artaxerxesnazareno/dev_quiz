# Flashcards Flutter - Aula 2 NLW

Este arquivo contém flashcards técnicos sobre Flutter baseados na Aula 2 da trilha Flutter do NLW. Os flashcards seguem as melhores práticas para memorização eficiente.

## Flashcard 1: Componentização em Flutter

**Frente:**
O que é componentização em Flutter e por que é importante?

**Verso:**
Componentização em Flutter é o processo de dividir a interface em widgets menores e reutilizáveis. Benefícios:
- Reutilização de código (DRY - Don't Repeat Yourself)
- Melhor organização e manutenção
- Código mais limpo e separação de responsabilidades
- Facilita testes unitários

**Exemplo de código:**
```dart
// Widget componentizado reutilizável
class ScoreCardWidget extends StatelessWidget {
  const ScoreCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(flex: 1, child: ChartWidget()),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Vamos começar', style: AppTextStyles.heading),
                  Text('Complete os desafios!', style: AppTextStyles.body),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

**Sugestão de imagem:** Diagrama mostrando uma tela Flutter decomposta em componentes menores, com setas indicando a hierarquia dos widgets.

## Flashcard 2: ListView vs GridView

**Frente:**
Qual a diferença entre ListView e GridView em Flutter e quando usar cada um?

**Verso:**
**ListView:**
- Organiza elementos em lista linear (vertical ou horizontal)
- Ideal para listas simples de itens empilhados
- Suporta rolagem infinita com `ListView.builder`
- Menor consumo de memória em listas longas

**GridView:**
- Organiza elementos em grade (múltiplas colunas/linhas)
- Ideal para galerias, dashboards, itens visuais
- Configurável com `GridView.count` ou `GridView.extent`
- Permite visualizar mais conteúdo na mesma tela

**Exemplo de código:**
```dart
// ListView
ListView(
  children: [
    QuizCardWidget(),
    QuizCardWidget(),
    QuizCardWidget(),
  ],
)

// GridView
GridView.count(
  crossAxisCount: 2, // Número de colunas
  crossAxisSpacing: 8, // Espaçamento horizontal
  mainAxisSpacing: 16, // Espaçamento vertical
  children: [
    QuizCardWidget(),
    QuizCardWidget(),
    QuizCardWidget(),
    QuizCardWidget(),
  ],
)
```

**Sugestão de imagem:** Comparação lado a lado entre ListView e GridView mostrando a mesma quantidade de itens em cada layout.

## Flashcard 3: Lidando com Overflow em Flutter

**Frente:**
Como detectar e resolver problemas de overflow em Flutter?

**Verso:**
**Detecção:**
- Erro "A RenderFlex overflowed by X pixels..."
- Faixas amarelas e pretas na tela
- Erros no console durante o desenvolvimento

**Soluções:**
1. Usar `Expanded` ou `Flexible` para distribuir espaço
2. Usar `SingleChildScrollView` para permitir rolagem
3. Ativar `softWrap: true` e `overflow: TextOverflow.ellipsis` em Text
4. Usar `FittedBox` para ajustar conteúdo ao espaço disponível
5. Ajustar tamanhos e paddings para comportar o conteúdo

**Exemplo de código:**
```dart
// Solução para texto em layout com espaço limitado
Row(
  children: [
    Icon(Icons.star),
    SizedBox(width: 4),
    Expanded(
      child: Text(
        "Texto muito longo que pode causar overflow",
        overflow: TextOverflow.ellipsis,
      ),
    ),
  ],
)
```

**Sugestão de imagem:** Comparação entre uma tela com erro de overflow (marcações amarelo/preto) e a mesma tela corrigida.

## Flashcard 4: BoxDecoration em Flutter

**Frente:**
Como usar BoxDecoration para estilizar containers em Flutter?

**Verso:**
BoxDecoration permite estilizar Containers com:
- Cor de fundo (`color`)
- Bordas (`border`)
- Arredondamento de bordas (`borderRadius`)
- Gradientes (`gradient`)
- Sombras (`boxShadow`)
- Imagens de fundo (`image`)

**Exemplo de código:**
```dart
Container(
  height: 136,
  decoration: BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(15),
    border: Border.fromBorderSide(
      BorderSide(color: AppColors.border),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 4,
        offset: Offset(0, 2),
      ),
    ],
  ),
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Text("Card estilizado"),
  ),
)
```

**Sugestão de imagem:** Card com elementos visuais destacando cada parte do BoxDecoration (bordas, sombras, raios, cores).

## Flashcard 5: LinearProgressIndicator Personalizado

**Frente:**
Como personalizar um LinearProgressIndicator em Flutter?

**Verso:**
Para personalizar um LinearProgressIndicator:

1. Defina o valor (`value`) entre 0.0 e 1.0 
2. Use `backgroundColor` para o fundo da barra
3. Use `valueColor` com `AlwaysStoppedAnimation<Color>` para a cor da barra
4. Ajuste a altura com um `Container`
5. Defina se a animação ocorre usando `value` (determinado) ou sem value (indeterminado)

**Exemplo de código:**
```dart
Container(
  height: 8, // Ajusta a altura da barra
  child: LinearProgressIndicator(
    value: 0.7, // 70% completo
    backgroundColor: AppColors.chartSecondary,
    valueColor: AlwaysStoppedAnimation<Color>(
      AppColors.chartPrimary,
    ),
    borderRadius: BorderRadius.circular(5), // Flutter 2.5+
  ),
)
```

**Sugestão de imagem:** Exemplos de barras de progresso com diferentes valores e cores, mostrando a personalização.

## Flashcard 6: Row e Column com Expanded e Flex

**Frente:**
Como usar Row/Column com Expanded e propriedade flex para criar layouts proporcionais?

**Verso:**
Row e Column com Expanded e flex permitem:
- Distribuir espaço disponível proporcionalmente entre widgets
- Definir quanto espaço cada widget ocupará (flex)
- Evitar problemas de overflow
- Criar layouts responsivos

**Funcionamento:**
- Widgets sem Expanded mantêm tamanho original
- Widgets com Expanded compartilham espaço disponível
- O valor do flex define a proporção (como frações do espaço)

**Exemplo de código:**
```dart
Row(
  children: [
    Expanded(
      flex: 1, // Ocupa 25% do espaço (1/4)
      child: ChartWidget(),
    ),
    Expanded(
      flex: 3, // Ocupa 75% do espaço (3/4)
      child: Column(
        children: [
          Text('Título'),
          Text('Subtítulo'),
        ],
      ),
    ),
  ],
)
```

**Sugestão de imagem:** Diagrama mostrando como o espaço é dividido entre widgets com diferentes valores de flex.

## Flashcard 7: SafeArea em Flutter

**Frente:**
O que é o widget SafeArea e quando usá-lo em Flutter?

**Verso:**
SafeArea é um widget que insere seu filho com padding suficiente para evitar áreas de sistema do dispositivo como:
- Notch, câmera frontal ou sensores
- Barra de status
- Barra de navegação inferior
- Áreas de arredondamento da tela

É recomendado usar SafeArea quando:
- Seu conteúdo precisa ser totalmente visível
- Você não está usando AppBar (que já considera essas áreas)
- Seu conteúdo se estende até as bordas da tela

**Exemplo de código:**
```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    // Sem AppBar definida
    body: SafeArea(
      child: Column(
        children: [
          Text('Este texto não será coberto pela barra de status'),
          // Conteúdo do app
        ],
      ),
    ),
  );
}
```

**Sugestão de imagem:** Comparação entre tela com e sem SafeArea, mostrando texto cortado pela notch/statusbar vs. texto com padding adequado.

## Flashcard 8: MainAxisAlignment e CrossAxisAlignment

**Frente:**
Explique a diferença entre MainAxisAlignment e CrossAxisAlignment no Flutter.

**Verso:**
**MainAxisAlignment:**
- Define alinhamento no eixo principal
- Em Row: horizontal (esquerda para direita)
- Em Column: vertical (cima para baixo)
- Valores: start, end, center, spaceBetween, spaceAround, spaceEvenly

**CrossAxisAlignment:**
- Define alinhamento no eixo cruzado (perpendicular ao principal)
- Em Row: vertical (cima para baixo)
- Em Column: horizontal (esquerda para direita)
- Valores: start, end, center, stretch, baseline

**Exemplo de código:**
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espaço vertical entre widgets
  crossAxisAlignment: CrossAxisAlignment.start, // Alinha à esquerda
  children: [
    Text('Primeiro item'),
    Text('Segundo item'),
    Text('Terceiro item'),
  ],
)
```

**Sugestão de imagem:** Grid mostrando diferentes combinações de MainAxisAlignment e CrossAxisAlignment em Row e Column.

## Flashcard 9: SizeBox para Espaçamento em Flutter

**Frente:**
Como e por que usar SizedBox para espaçamento em Flutter?

**Verso:**
SizedBox é usado para:
- Criar espaçamentos precisos entre widgets
- Definir dimensões exatas para widgets
- Criar espaços vazios com tamanho específico
- Alternativa mais limpa do que usar Padding em alguns casos

**Vantagens:**
- Código mais legível que Padding para espaços simples
- Comportamento previsível
- Boa prática para espaçamento vertical/horizontal consistente
- Mais eficiente que Container vazio

**Exemplo de código:**
```dart
Column(
  children: [
    Text('Primeiro texto'),
    SizedBox(height: 24), // Espaçamento vertical de 24 pixels
    Text('Segundo texto'),
    SizedBox(height: 16), // Espaçamento vertical de 16 pixels
    Row(
      children: [
        Icon(Icons.star),
        SizedBox(width: 8), // Espaçamento horizontal de 8 pixels
        Text('Avaliação'),
      ],
    ),
  ],
)
```

**Sugestão de imagem:** Layout mostrando o uso de SizedBox para criar espaçamentos uniformes entre elementos.

## Flashcard 10: Reaproveitando Código com Widgets Compartilhados

**Frente:**
Qual a melhor forma de reutilizar widgets em diferentes partes do app Flutter?

**Verso:**
Para reutilizar widgets em Flutter:

1. **Criar pasta shared/widgets** para componentes usados em múltiplas partes
2. **Parametrizar widgets** com construtores que aceitam valores customizáveis
3. **Usar composição** em vez de herança para flexibilidade
4. **Separar lógica de UI** para facilitar reuso
5. **Implementar construtor const** para melhor performance

**Exemplo de código:**
```dart
// lib/shared/widgets/progress_indicator/progress_indicator_widget.dart
class ProgressIndicatorWidget extends StatelessWidget {
  final double value;
  
  const ProgressIndicatorWidget({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: AppColors.chartSecondary,
      valueColor: AlwaysStoppedAnimation<Color>(
        AppColors.chartPrimary,
      ),
    );
  }
}

// Uso em qualquer lugar do app:
ProgressIndicatorWidget(value: 0.7)
```

**Sugestão de imagem:** Diagrama mostrando o mesmo widget sendo usado em diferentes telas do aplicativo.

## Flashcard 11: Método required em Flutter

**Frente:**
O que é o modificador `required` em Flutter e quando usá-lo?

**Verso:**
O modificador `required` no Flutter:
- Marca parâmetros nomeados como obrigatórios (não opcionais)
- Faz com que o compilador verifique se o parâmetro foi fornecido
- Parte do recurso null safety introduzido no Dart 2.12+
- Substitui o uso de `@required` de versões anteriores

**Quando usar:**
- Para parâmetros essenciais que não podem ser null
- Em construtores de widgets customizados
- Quando não há um valor padrão sensato para o parâmetro

**Exemplo de código:**
```dart
class LevelButtonWidget extends StatelessWidget {
  final String label;
  
  // label é obrigatório, não pode ser omitido
  const LevelButtonWidget({
    Key? key, 
    required this.label,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(label),
    );
  }
}

// Uso correto:
LevelButtonWidget(label: "Fácil")

// Erro de compilação:
LevelButtonWidget() // Falta o parâmetro obrigatório label
```

**Sugestão de imagem:** Screenshot de erro de compilação quando um parâmetro required não é fornecido.

## Flashcard 12: Getters para Seletores Condicionais em Flutter

**Frente:**
Como usar getters para lidar com seletores condicionais de estilo em Flutter?

**Verso:**
Getters em Flutter são úteis para:
- Encapsular lógica condicional de estilo
- Deixar o código do widget mais limpo
- Centralizar mudanças de estilo baseadas em estados
- Evitar repetição de código de estilo

**Exemplo de código:**
```dart
class AnswerWidget extends StatelessWidget {
  final String title;
  final bool isRight;
  final bool isSelected;

  const AnswerWidget({
    Key? key,
    required this.title,
    this.isRight = false,
    this.isSelected = false,
  }) : super(key: key);
  
  // Getters condicionais para estilo
  Color get _selectedColorRight => isRight ? AppColors.darkGreen : AppColors.darkRed;
  
  Color get _selectedBorderRight => isRight ? AppColors.lightGreen : AppColors.lightRed;
  
  Color get _selectedColorCardRight => isRight ? AppColors.lightGreen : AppColors.lightRed;
  
  Color get _selectedBorderCardRight => isRight ? AppColors.green : AppColors.red;
  
  TextStyle get _selectedTextStyleRight => isRight 
    ? AppTextStyles.bodyDarkGreen 
    : AppTextStyles.bodyDarkRed;
  
  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? _selectedColorCardRight : AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.fromBorderSide(
          BorderSide(
            color: isSelected ? _selectedBorderCardRight : AppColors.border,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: isSelected ? _selectedTextStyleRight : AppTextStyles.body,
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isSelected ? _selectedColorRight : AppColors.white,
                borderRadius: BorderRadius.circular(500),
                border: Border.fromBorderSide(
                  BorderSide(
                    color: isSelected ? _selectedBorderRight : AppColors.border,
                  ),
                ),
              ),
              child: isSelected
                  ? Icon(
                      _selectedIconRight,
                      size: 16,
                      color: Colors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
```

**Sugestão de imagem:** Demonstração visual de um componente de resposta em diferentes estados (normal, selecionado correto, selecionado incorreto).

Flashcard 1
Frente (Pergunta)
🔹 Qual a diferença entre spaceAround e spaceBetween no MainAxisAlignment do Flutter?

Verso (Resposta)
✅ spaceAround: Distribui espaço ao redor dos widgets. O primeiro e o último têm metade do espaço nas extremidades.

✅ spaceBetween: Distribui espaço somente entre os widgets. O primeiro e o último ficam colados às extremidades.

🔹 Exemplo visual:

spaceAround:
| 🟢 | 🟢 | 🟢 | (Espaço ao redor)

spaceBetween:
🟢 🟢 🟢 (Sem espaço nas extremidades)

🔹 Código:

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround, // ou spaceBetween
  children: [
    Icon(Icons.star, size: 50),
    Icon(Icons.star, size: 50),
    Icon(Icons.star, size: 50),
  ],
)
```

Flashcard 1
Frente (Pergunta)
🔹 O que o widget Expanded faz no Flutter?

Verso (Resposta)
✅ Expanded faz com que um widget ocupe o máximo de espaço disponível dentro de um Row, Column ou Flex.
✔ Ele ajusta automaticamente o tamanho do filho, respeitando outros widgets na linha/coluna.

Flashcard 2
Frente (Pergunta)
🔹 Quando usar Expanded em Flutter?

Verso (Resposta)
✅ Use Expanded quando quiser que um widget cresça automaticamente para ocupar espaço disponível dentro de um Row ou Column, sem precisar definir tamanhos fixos.

🔹 Exemplo:
```dart
Row(
  children: [
    Expanded(child: Container(color: Colors.red, height: 100)),
    Expanded(child: Container(color: Colors.blue, height: 100)),
  ],
)
```
✔ Isso distribui o espaço igualmente entre os Containers.

Flashcard 3
Frente (Pergunta)
🔹 Como controlar a proporção de espaço ocupado por Expanded?

Verso (Resposta)
✅ Use a propriedade flex para definir a proporção do espaço que cada Expanded ocupa.

🔹 Exemplo:
```dart
Row(
  children: [
    Expanded(flex: 2, child: Container(color: Colors.red, height: 100)),
    Expanded(flex: 1, child: Container(color: Colors.blue, height: 100)),
  ],
)
```
✔ O vermelho ocupa o dobro do espaço do azul.

Flashcard 1
Frente (Pergunta)
🔹 Para que serve o SafeArea no Flutter?

Verso (Resposta)
✅ O SafeArea protege o conteúdo da tela, evitando que fique escondido atrás da barra de status, notch ou barra de navegação inferior.

✔ Muito útil para telas fullscreen.

Flashcard 2
Frente (Pergunta)
🔹 Como usar o SafeArea no Flutter?

Verso (Resposta)
✅ Basta envolver o widget principal com SafeArea:

```dart
SafeArea(
  child: Column(
    children: [
      Text("Estou seguro! 😃"),
    ],
  ),
)
```
✔ O texto não ficará coberto pela barra de status ou pelo notch.

Flashcard 3
Frente (Pergunta)
🔹 O SafeArea sempre adiciona espaçamento em todos os lados?

Verso (Resposta)
❌ Não!
✅ Por padrão, ele adiciona espaçamento apenas onde for necessário.
✔ Mas podes personalizar com minimum ou desativar lados específicos com left, top, right e bottom.

🔹 Exemplo:
```dart
SafeArea(
  top: false, // Não aplica margem no topo
  child: Text("Protegido nas laterais!"),
)
```
✔ O texto não terá espaçamento no topo.




