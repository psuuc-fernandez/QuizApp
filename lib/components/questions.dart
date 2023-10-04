import 'package:fernandezassignment3/data/questions_list.dart';
import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  Questions({Key? key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  //declaration of call and variables
  final List<Map<String, dynamic>> questionsList = QUESTIONS_LIST;
  int questionIndex = 0;
  int score = 0;
  bool isFinished = false;

//function for checking answer
  void checkAnswer(String selectedAnswer) {
    final correctAnswer = questionsList[questionIndex]['correctAnswer'];
    setState(() {
      if (selectedAnswer == correctAnswer) {
        score++;
      }
      if (questionIndex < questionsList.length - 1) {
        questionIndex++;
      } else {
        isFinished = true;
      }
    });
  }

  Widget showQuestion() {
    final question = questionsList[questionIndex]['question'];
    final options = questionsList[questionIndex]['options'] as List<String>;

//for displaying questions and choices
    return Padding(
      padding: const EdgeInsets.only(top: 90),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              question,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w200),
            ),
            const SizedBox(height: 12),
            const SizedBox(height: 12),
            ...options.map((option) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8), // Adjust padding here
                    width: double.infinity, // Set width to stretch
                    child: ElevatedButton(
                      onPressed: () => checkAnswer(option),
                      child: Text(option),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget showScore() {
    String message = '';
    if (score >= 1 && score <= 5) {
      message = 'You failed';
    } else if (score >= 6 && score <= 8) {
      message = "That's good";
    } else if (score >= 9 && score <= 10) {
      message = 'Perfect';
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          const SizedBox(height: 18),
          Text(
            '$score/10',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                questionIndex = 0;
                score = 0;
                isFinished = false;
              });
            },
            child: const Text('Reset Quiz'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 36),
        child: isFinished ? showScore() : showQuestion(),
      ),
    );
  }
}
