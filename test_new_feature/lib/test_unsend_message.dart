import 'package:flutter/material.dart';

class TestRemoveMessage extends StatefulWidget {
  const TestRemoveMessage({Key? key}) : super(key: key);

  @override
  State<TestRemoveMessage> createState() => _TestRemoveMessageState();
}

class _TestRemoveMessageState extends State<TestRemoveMessage> {
  final messageItems = [
    'Le Chi Nhin',
    'Le Chi Nhin',
    'Le Chi Nhin',
    'Le Chi Nhin',
    'Le Chi Nhin',
    'Le Chi Nhin',
    'Le Chi Nhin',
    'Le Chi Nhin',
  ];
  double height = 0;

  @override
  void didChangeDependencies() {
    height = MediaQuery.of(context).size.height;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: 400,
        child: ListView.builder(
          itemCount: messageItems.length,
          itemBuilder: (context, index) {
            return MessageItem(
              text: messageItems[index],
            );
          },
        ),
      ),
    );
  }
}

class MessageItem extends StatefulWidget {
  final String text;

  const MessageItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: isHover
                ? TextButton(
                    onPressed: () {},
                    child: const Icon(Icons.more_vert_rounded),
                    style: TextButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(12),
                    ),
                  )
                : const SizedBox(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amber,
                ),
                child: Text(widget.text),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
