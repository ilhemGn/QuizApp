class QuestionModel {
  String questiontext;
  List<String> answers;

  QuestionModel({required this.questiontext, required this.answers});

  List<String> getShuffledList() {
    final List<String> shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
