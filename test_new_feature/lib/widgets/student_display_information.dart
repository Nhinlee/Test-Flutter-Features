import 'package:flutter/material.dart';

class StudentInformationDisplay extends StatelessWidget {
  final String grade;
  final String courses;
  final String studentClass;

  const StudentInformationDisplay({
    Key? key,
    required this.grade,
    required this.courses,
    required this.studentClass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Container(
        width: 800,
        margin: const EdgeInsets.only(left: 300),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildToolTipInfo(
              'Grade: $grade',
            ),
            buildDivider(),
            buildToolTipInfo(
              'Course: $courses',
            ),
            buildDivider(),
            buildToolTipInfo(
              'Class: $studentClass',
            ),
            const Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildToolTipInfo(String info) {
    return Flexible(
      flex: 2,
      fit: FlexFit.loose,
      child: Tooltip(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        richMessage: WidgetSpan(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: buildToolTipText(info),
          ),
        ),
        child: buildTextInfo(info),
      ),
    );
  }

  Widget buildToolTipText(
    String info, {
    TextStyle textStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  }) {
    return Text(
      info,
      style: textStyle,
    );
  }

  Widget buildTextInfo(
    String info, {
    TextStyle textStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  }) {
    return Text(
      info,
      overflow: TextOverflow.ellipsis,
      style: textStyle,
    );
  }

  Widget buildDivider() {
    return Container(
      height: 20,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const VerticalDivider(
        width: 1,
        thickness: 1,
        indent: 1,
        color: Colors.black,
      ),
    );
  }
}
