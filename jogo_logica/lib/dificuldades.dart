class Questao {
  String pergunta = "";
  bool resposta = false;

  Questao(this.pergunta, this.resposta);
}

List<Questao> facil = [
  Questao("Verdadeiro ∧ Verdadeiro ", true),
  Questao("Verdadeiro ∧ Falso", false),
  Questao("Falso ∧ Verdadeiro", false),
  Questao("Falso ∧ Falso", false),
  Questao("Verdadeiro ∨ Verdadeiro", true),
  Questao("Verdadeiro ∨ Falso", true),
  Questao("Falso ∨ Verdadeiro", true),
  Questao("Falso ∨ Falso", false),
  Questao("¬Verdadeiro", false),
  Questao("¬Falso", true),
];

List<Questao> medio = [
  Questao("(Verdadeiro ∧ Falso) ∨ Verdadeiro", true),
  Questao("¬(Verdadeiro ∨ Falso)", false),
  Questao("(¬Verdadeiro ∧ Verdadeiro) ∨ Falso", false),
  Questao("¬(Falso ∨ Verdadeiro) ∨ (Verdadeiro ∧ Verdadeiro)", true),
  Questao("(Falso ∧ Falso) ∨ (Verdadeiro ∧ ¬Falso)", true),
  Questao("¬(Falso ∨ ¬Verdadeiro)", false),
  Questao("Verdadeiro ∨ (¬Verdadeiro ∧ Falso)", true),
  Questao("¬(Verdadeiro ∧ Falso) ∧ (Verdadeiro ∨ Falso)", true),
  Questao("(¬Verdadeiro ∧ ¬Falso) ∨ Verdadeiro", true),
  Questao("¬(Verdadeiro ∧ (Verdadeiro ∨ Falso))", false),
];

List<Questao> dificil = [
  Questao("¬((Verdadeiro ∧ Falso) ∨ (¬Verdadeiro ∧ Verdadeiro))", true),
  Questao("(¬(Verdadeiro ∨ Falso) ∧ (Falso ∨ Verdadeiro)) ∨ Verdadeiro", true),
  Questao("(¬(Verdadeiro ∧ Verdadeiro) ∨ (Falso ∨ ¬Falso)) ∧ Falso", false),
  Questao("¬((Verdadeiro ∨ ¬Falso) ∧ (¬Verdadeiro ∨ Verdadeiro))", false),
  Questao(
      "(Verdadeiro ∧ (¬Falso ∨ Verdadeiro)) ∧ ¬(Falso ∨ Verdadeiro)", false),
  Questao(
      "(¬(Verdadeiro ∨ Verdadeiro) ∧ ¬Falso) ∨ (Verdadeiro ∧ ¬Falso)", true),
  Questao(
      "¬(Verdadeiro ∨ (¬Falso ∧ Verdadeiro)) ∨ (Falso ∧ Verdadeiro)", false),
  Questao(
      "(¬(Verdadeiro ∧ ¬Verdadeiro) ∨ (Falso ∧ ¬Falso)) ∧ Verdadeiro", true),
  Questao("(¬(Verdadeiro ∨ Falso) ∧ ¬(Falso ∨ Verdadeiro)) ∨ ¬Falso", true),
  Questao(
      "¬(¬(Verdadeiro ∧ (Falso ∨ ¬Verdadeiro)) ∨ (Verdadeiro ∧ Verdadeiro))",
      false),
];
