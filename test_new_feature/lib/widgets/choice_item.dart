import 'package:flutter/material.dart';

class ChoiceItem extends StatelessWidget {
  final int index;
  final String text;
  final bool active;

  const ChoiceItem({
    Key? key,
    required this.index,
    required this.text,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: active
            ? Border.all(
                color: const Color(0XFF395AD2),
                width: 2,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 8),
            blurRadius: 16,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Text(text),
            ),
            Icon(
              Icons.do_not_disturb_on_total_silence,
              color: active ? const Color(0XFF395AD2) : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
