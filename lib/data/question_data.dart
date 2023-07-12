import 'package:quiz_app/models/question_model.dart';

class QuestionData {
  final List<QuestionModel> _questionBank = [
    QuestionModel(
      questiontext: 'What are the main building blocks of Flutter UIs?',
      answers: [
        'Widgets',
        'Components',
        'Blocks',
        'Functions',
      ],
    ),
    QuestionModel(questiontext: 'How are Flutter UIs built?', answers: [
      'By combining widgets in code',
      'By combining widgets in a visual editor',
      'By defining widgets in config files',
      'By using XCode for iOS and Android Studio for Android',
    ]),
    QuestionModel(
      questiontext: 'What\'s the purpose of a StatefulWidget?',
      answers: [
        'Update UI as data changes',
        'Update data as UI changes',
        'Ignore data changes',
        'Render UI that does not depend on data',
      ],
    ),
    QuestionModel(
      questiontext:
          'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
      answers: [
        'StatelessWidget',
        'StatefulWidget',
        'Both are equally good',
        'None of the above',
      ],
    ),
    QuestionModel(
      questiontext: 'What happens if you change data in a StatelessWidget?',
      answers: [
        'The UI is not updated',
        'The UI is updated',
        'The closest StatefulWidget is updated',
        'Any nested StatefulWidgets are updated',
      ],
    ),
    QuestionModel(
      questiontext: 'How should you update data inside of StatefulWidgets?',
      answers: [
        'By calling setState()',
        'By calling updateData()',
        'By calling updateUI()',
        'By calling updateState()',
      ],
    ),
  ];

  String getQstText(int nbr) {
    return _questionBank[nbr].questiontext;
  }

  List<String> getShuffledAnswers(int nbr) {
    return _questionBank[nbr].getShuffledList();
  }

  List<String> getAnswers(int nbr) {
    return _questionBank[nbr].answers;
  }

  int get lenght {
    return _questionBank.length;
  }
}
