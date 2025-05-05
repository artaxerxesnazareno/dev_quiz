# Flashcards Flutter - Aula 3 NLW

## Flashcard 1: Gerenciamento de Estado com ValueNotifier

**Frente:**
O que é ValueNotifier e como usá-lo para gerenciamento de estado em Flutter?

**Verso:**
ValueNotifier é uma classe que notifica seus ouvintes quando seu valor muda. É útil para:
- Gerenciamento de estado simples
- Notificação de mudanças de valor
- Atualização automática da UI

**Exemplo de código:**
```dart
class HomeController {
  ValueNotifier<HomeState> homeState = ValueNotifier<HomeState>(
    HomeState.empty,
  );
  
  // No StatefulWidget
  @override
  void initState() {
    super.initState();
    controller.homeState.addListener(() {
      setState(() {});
    });
  }
}
```

**Sugestão de imagem:** Diagrama mostrando o fluxo de dados do ValueNotifier: Controller -> ValueNotifier -> Widget.

## Flashcard 2: Enums para Gerenciamento de Estado

**Frente:**
Como usar enums para gerenciar estados em Flutter?

**Verso:**
Enums são úteis para:
- Definir estados possíveis da aplicação
- Tornar o código mais legível e type-safe
- Facilitar o controle de fluxo com switch/case

**Exemplo de código:**
```dart
enum HomeState { 
  loading, 
  success, 
  error, 
  empty 
}

// Uso
if (state == HomeState.success) {
  // Mostrar conteúdo
} else if (state == HomeState.loading) {
  // Mostrar loading
}
```

**Sugestão de imagem:** Diagrama de estados mostrando as transições possíveis entre os diferentes estados.

## Flashcard 3: Repository Pattern em Flutter

**Frente:**
O que é o Repository Pattern e como implementá-lo em Flutter?

**Verso:**
Repository Pattern é um padrão de projeto que:
- Separa a lógica de acesso a dados
- Abstrai a fonte de dados (API, local, etc)
- Facilita testes e manutenção

**Exemplo de código:**
```dart
class HomeRepository {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString('assets/database/user.json');
    final user = UserModel.fromJson(response);
    return user;
  }

  Future<List<QuizModel>> getQuizzes() async {
    final response = await rootBundle.loadString('assets/database/quizzes.json');
    final list = jsonDecode(response) as List;
    final quizzes = list.map((e) => QuizModel.fromMap(e)).toList();
    return quizzes;
  }
}
```

**Sugestão de imagem:** Diagrama mostrando a arquitetura em camadas com Repository como intermediário entre dados e UI.

## Flashcard 4: Modelos de Dados em Flutter

**Frente:**
Como implementar modelos de dados em Flutter com fromJson/fromMap?

**Verso:**
Boas práticas para modelos de dados:
- Usar factory constructors para parse
- Implementar fromJson e fromMap
- Validar dados no construtor
- Usar tipos corretos para cada campo

**Exemplo de código:**
```dart
class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionAnswered = 0,
    required this.level,
  });

  factory QuizModel.fromMap(Map<String, dynamic> json) {
    return QuizModel(
      title: json["title"],
      questions: List.of(json["questions"])
          .map((i) => QuestionModel.fromMap(i))
          .toList(),
      questionAnswered: json["questionAnswered"],
      level: json["level"].toString().parse,
    );
  }
}
```

**Sugestão de imagem:** Diagrama mostrando a conversão de JSON para objeto Dart.

## Flashcard 5: Extensions em Dart

**Frente:**
Como e quando usar Extensions em Dart para melhorar o código?

**Verso:**
Extensions permitem:
- Adicionar funcionalidades a tipos existentes
- Melhorar a legibilidade do código
- Criar conversões e utilitários reutilizáveis

**Exemplo de código:**
```dart
extension LevelStringExt on String {
  Level get parse =>
      {
        'facil': Level.facil,
        'medio': Level.medio,
        'dificil': Level.dificil,
        'perito': Level.perito,
      }[this]!;
}

// Uso
"facil".parse // retorna Level.facil
```

**Sugestão de imagem:** Diagrama mostrando como extensions estendem funcionalidades de tipos existentes.

## Flashcard 6: GridView.count em Flutter

**Frente:**
Como implementar um grid de widgets com GridView.count?

**Verso:**
GridView.count é útil para:
- Criar layouts em grade
- Definir número fixo de colunas
- Controlar espaçamento entre itens

**Exemplo de código:**
```dart
GridView.count(
  crossAxisCount: 2,
  mainAxisSpacing: 16,
  crossAxisSpacing: 16,
  children: controller.quizzes!
      .map((e) => QuizCardWidget(
            title: e.title,
            percent: e.questionAnswered / e.questions.length,
            completed: "${e.questionAnswered}/${e.questions.length}",
          ))
      .toList(),
)
```

**Sugestão de imagem:** Layout de grid mostrando diferentes configurações de espaçamento e número de colunas.

## Flashcard 7: Assertions em Dart

**Frente:**
Para que servem as assertions em Dart e quando usá-las?

**Verso:**
Assertions são úteis para:
- Validar condições em tempo de desenvolvimento
- Garantir invariantes do código
- Documentar requisitos de forma executável

**Exemplo de código:**
```dart
class QuestionModel {
  final String title;
  final List<AwnserModel> awnsers;

  QuestionModel({required this.title, required this.awnsers})
      : assert(awnsers.length == 4, 'Uma questão deve ter exatamente 4 respostas');
}
```

**Sugestão de imagem:** Diagrama mostrando o fluxo de execução com e sem assertions.

## Flashcard 8: Carregamento de Assets em Flutter

**Frente:**
Como carregar e gerenciar assets (JSON, imagens) em Flutter?

**Verso:**
Para carregar assets:
1. Declare no pubspec.yaml
2. Use rootBundle.loadString para JSON
3. Use Image.asset para imagens
4. Organize em pastas por tipo

**Exemplo de código:**
```dart
// Carregando JSON
final response = await rootBundle.loadString('assets/database/user.json');
final user = UserModel.fromJson(response);

// Carregando imagem
Image.asset(AppImages.blocks)
```

**Sugestão de imagem:** Estrutura de pastas mostrando organização de assets.

## Flashcard 9: Gerenciamento de Estado com Controller

**Frente:**
Como implementar um Controller para gerenciar estado em Flutter?

**Verso:**
Um Controller deve:
- Centralizar lógica de negócios
- Gerenciar estado da tela
- Comunicar com Repository
- Notificar mudanças de estado

**Exemplo de código:**
```dart
class HomeController {
  final repository = HomeRepository();
  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.loading;
    try {
      user = await repository.getUser();
      state = HomeState.success;
    } catch (e) {
      state = HomeState.error;
    }
  }
}
```

**Sugestão de imagem:** Diagrama MVC/MVVM mostrando o papel do Controller.

## Flashcard 10: Tratamento de Erros em Flutter

**Frente:**
Como implementar tratamento de erros em Flutter de forma elegante?

**Verso:**
Boas práticas:
- Use try/catch em operações assíncronas
- Atualize estado para indicar erro
- Forneça feedback visual ao usuário
- Mantenha estados consistentes

**Exemplo de código:**
```dart
Future<void> getQuizzes() async {
  state = HomeState.loading;
  try {
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  } catch (e) {
    state = HomeState.error;
  }
}
```

**Sugestão de imagem:** Fluxograma mostrando diferentes caminhos de tratamento de erro.

## Perguntas Práticas

1. Como o ValueNotifier ajuda no gerenciamento de estado da HomePage?
2. Por que usar enum HomeState em vez de strings para controle de estado?
3. Qual a vantagem de usar o Repository Pattern na implementação dos quizzes?
4. Como o GridView.count ajuda na organização dos QuizCardWidgets?
5. Por que usar assertions na validação de questões do quiz?
6. Como o Controller separa a lógica de negócios da UI?
7. Qual a importância das Extensions na implementação do Level enum?
8. Como o tratamento de erros melhora a experiência do usuário?
9. Por que usar factory constructors nos modelos de dados?
10. Como o carregamento assíncrono de dados afeta a UI?

## Dicas para Memorização

- **Visualize o Fluxo**: Crie diagramas mentais do fluxo de dados entre Repository, Controller e UI
- **Pratique os Padrões**: Implemente os padrões em projetos pequenos para fixar
- **Relacione Conceitos**: Conecte os conceitos com problemas reais que eles resolvem
- **Use Analogias**: Compare os conceitos técnicos com situações do dia a dia 