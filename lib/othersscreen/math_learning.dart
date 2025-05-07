import 'package:flutter/material.dart';
import 'dart:math';

enum MathOperation { addition, subtraction, multiplication, division }

class MathLearning extends StatefulWidget {
  final MathOperation operation;

  const MathLearning({super.key, required this.operation});

  @override
  _MathLearningState createState() => _MathLearningState();
}

class _MathLearningState extends State<MathLearning> {
  int num1 = 0;
  int num2 = 0;
  String feedback = "";
  Color feedbackColor = Colors.black;
  bool isCorrect = false;
  int score = 0;
  int attempts = 0;
  final TextEditingController _answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    generateNewProblem();
  }

  void generateNewProblem() {
    final Random random = Random();

    switch (widget.operation) {
      case MathOperation.addition:
        num1 = random.nextInt(20) + 1;
        num2 = random.nextInt(20) + 1;
        break;
      case MathOperation.subtraction:
        num1 = random.nextInt(20) + 5;
        num2 = random.nextInt(num1) + 1;
        break;
      case MathOperation.multiplication:
        num1 = random.nextInt(10) + 1;
        num2 = random.nextInt(10) + 1;
        break;
      case MathOperation.division:
        num2 = random.nextInt(10) + 1;
        num1 = num2 * (random.nextInt(10) + 1);
        break;
    }

    setState(() {
      feedback = "";
      _answerController.clear();
      isCorrect = false;
    });
  }

  int getCorrectAnswer() {
    switch (widget.operation) {
      case MathOperation.addition:
        return num1 + num2;
      case MathOperation.subtraction:
        return num1 - num2;
      case MathOperation.multiplication:
        return num1 * num2;
      case MathOperation.division:
        return num1 ~/ num2;
    }
  }

  String getOperationSymbol() {
    switch (widget.operation) {
      case MathOperation.addition:
        return '+';
      case MathOperation.subtraction:
        return '-';
      case MathOperation.multiplication:
        return '×';
      case MathOperation.division:
        return '÷';
    }
  }

  String getOperationName() {
    switch (widget.operation) {
      case MathOperation.addition:
        return 'যোগ';
      case MathOperation.subtraction:
        return 'বিয়োগ';
      case MathOperation.multiplication:
        return 'গুণ';
      case MathOperation.division:
        return 'ভাগ';
    }
  }

  Color getOperationColor() {
    switch (widget.operation) {
      case MathOperation.addition:
        return Colors.green.shade600;
      case MathOperation.subtraction:
        return Colors.red.shade600;
      case MathOperation.multiplication:
        return Colors.orange.shade600;
      case MathOperation.division:
        return Colors.purple.shade600;
    }
  }

  Color getOperationLightColor() {
    switch (widget.operation) {
      case MathOperation.addition:
        return Colors.green.shade100;
      case MathOperation.subtraction:
        return Colors.red.shade100;
      case MathOperation.multiplication:
        return Colors.orange.shade100;
      case MathOperation.division:
        return Colors.purple.shade100;
    }
  }

  void checkAnswer() {
    int correctAnswer = getCorrectAnswer();
    int? providedAnswer = int.tryParse(_answerController.text);

    setState(() {
      attempts++;
      if (providedAnswer == correctAnswer) {
        feedback = "সঠিক উত্তর।";
        feedbackColor = Colors.green.shade700;
        isCorrect = true;
        score++;
      } else {
        feedback = "ঠিক হয়নি। আবার চেষ্টা করুন।";
        feedbackColor = Colors.red.shade700;
        isCorrect = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '${getOperationName()} শিখি',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: getOperationColor(),
        elevation: 2,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Problem card
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: getOperationColor(),
                              width: 1,
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: getOperationColor(),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Text(
                                        'প্রশ্ন',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    ),
                                  ),
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      // For smaller screens, use a more compact layout
                                      if (constraints.maxWidth < 340) {
                                        return Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                NumberBox(number: num1),
                                                const SizedBox(width: 10),
                                                Container(
                                                  width: 36,
                                                  height: 36,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: getOperationColor(),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      getOperationSymbol(),
                                                      style: const TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                NumberBox(number: num2),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  '=',
                                                  style: TextStyle(
                                                    fontSize: 36,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Container(
                                                  width: 60,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                    border: Border.all(
                                                      color:
                                                          getOperationColor(),
                                                      width: 1,
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      '?',
                                                      style: TextStyle(
                                                        fontSize: 36,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      }

                                      // For larger screens, use horizontal layout
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          NumberBox(number: num1),
                                          const SizedBox(width: 10),
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: getOperationColor(),
                                            ),
                                            child: Center(
                                              child: Text(
                                                getOperationSymbol(),
                                                style: const TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          NumberBox(number: num2),
                                          const SizedBox(width: 10),
                                          const Text(
                                            '=',
                                            style: TextStyle(
                                              fontSize: 36,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: getOperationColor(),
                                                width: 1,
                                              ),
                                              color: Colors.white,
                                            ),
                                            child: const Center(
                                              child: Text(
                                                '?',
                                                style: TextStyle(
                                                  fontSize: 36,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 200,
                                  ),
                                  child: TextField(
                                    controller: _answerController,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'উত্তর',
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: getOperationColor(),
                                          width: 1,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: getOperationColor(),
                                          width: 2,
                                        ),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            vertical: 12,
                                            horizontal: 16,
                                          ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: checkAnswer,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: getOperationColor(),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 40,
                                      vertical: 12,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 2,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.check, size: 20),
                                      const SizedBox(width: 8),
                                      const Text(
                                        'যাচাই করুন',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (feedback.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 10,
                                      ),
                                      constraints: const BoxConstraints(
                                        maxWidth: 280,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            isCorrect
                                                ? Colors.green.shade50
                                                : Colors.red.shade50,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: feedbackColor,
                                          width: 1,
                                        ),
                                      ),
                                      child: Text(
                                        feedback,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: feedbackColor,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Score card
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: getOperationColor(),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Text(
                                        'স্কোর',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                          width: 1,
                                        ),
                                      ),
                                      child: Text(
                                        '$score / $attempts',
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Next question button
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, -1),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: isCorrect ? generateNewProblem : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isCorrect ? Colors.blue.shade600 : Colors.grey.shade400,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                  ),
                  child: const Text(
                    'পরবর্তী প্রশ্ন',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }
}

// Custom widget for displaying numbers in boxes
class NumberBox extends StatelessWidget {
  final int number;

  const NumberBox({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
