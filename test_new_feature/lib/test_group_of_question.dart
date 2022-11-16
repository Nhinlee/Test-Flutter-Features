import 'package:flutter/material.dart';

class TestGroupOfQuestion extends StatefulWidget {
  const TestGroupOfQuestion({Key? key}) : super(key: key);

  @override
  State<TestGroupOfQuestion> createState() => _TestGroupOfQuestionState();
}

class _TestGroupOfQuestionState extends State<TestGroupOfQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  QuestionItem(),
                  GroupOfQuestionItem(
                    children: [
                      QuestionItem(),
                      QuestionItem(),
                      QuestionItem(),
                    ],
                  ),
                  GroupOfQuestionItem(
                    children: [
                      QuestionItem(),
                      QuestionItem(),
                      QuestionItem(),
                    ],
                  ),
                  GroupOfQuestionItem(
                    children: [
                      QuestionItem(),
                      QuestionItem(),
                      QuestionItem(),
                      QuestionItem(),
                      QuestionItem(),
                      QuestionItem(),
                      QuestionItem(),
                    ],
                  ),
                  GroupOfQuestionItem(
                    children: [
                      QuestionItem(),
                      QuestionItem(),
                      QuestionItem(),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class GroupOfQuestionItem extends StatelessWidget {
  final List<Widget> children;

  const GroupOfQuestionItem({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: children,
      ),
    );
  }
}

class QuestionItem extends StatelessWidget {
  const QuestionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 50,
      width: 50,
    );
  }
}
