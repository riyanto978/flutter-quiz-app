class Questions {
  final String question;
  final List<String> options;
  final int answer;

  const Questions(
      {required this.question, required this.options, required this.answer});
}

List<Questions> questions = const [
  Questions(question: "1 + 1 = ?", options: ["1", "2", "3", "4"], answer: 1),
  Questions(question: "2 + 2 = ?", options: ["7", "8", "4", "9"], answer: 2),
  Questions(question: "3 * 3 = ?", options: ["17", "28", "14", "9"], answer: 3),
  Questions(question: "4 / 2 = ?", options: ["5", "2", "1", "9"], answer: 1),
  Questions(
      question: "7 * 4 = ?", options: ["35", "32", "21", "19"], answer: 1),
];
