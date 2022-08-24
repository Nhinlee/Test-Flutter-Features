import 'package:flutter/material.dart';
import 'package:test_new_feature/widgets/choice_item.dart';

class TestFlutterReorderableListView extends StatefulWidget {
  const TestFlutterReorderableListView({Key? key}) : super(key: key);

  @override
  State<TestFlutterReorderableListView> createState() =>
      _TestFlutterReorderableListViewState();
}

class _TestFlutterReorderableListViewState
    extends State<TestFlutterReorderableListView> {
  final List<int> _items = List<int>.generate(50, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      header: const Text(
        'ReorderableListView',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      padding: const EdgeInsets.all(32),
      children: <Widget>[
        for (int index = 0; index < _items.length; index++)
          ReorderableDragStartListener(
            index: index,
            key: Key('Answer item: $index'),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ChoiceItem(
                index: index,
                text: 'Answer item: ${_items[index]}',
              ),
            ),
          ),
      ],
      onReorder: (int oldIndex, int newIndex) {
        if (newIndex > oldIndex) {
          newIndex--;
        }
        setState(() {
          final int item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        });
      },
      buildDefaultDragHandles: false,
      proxyDecorator: (child, index, animation) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ChoiceItem(
            index: index,
            text: 'Answer item: ${_items[index]}',
            active: true,
          ),
        );
      },
    );
  }
}
