import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:test_new_feature/widgets/choice_item.dart';

class DragAndDropTestScreen extends StatefulWidget {
  const DragAndDropTestScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DragAndDropTestScreen> createState() => _DragAndDropTestScreenState();
}

class _DragAndDropTestScreenState extends State<DragAndDropTestScreen> {
  List<DragAndDropList> _contents = [];
  List<bool> activeIndexes = [];

  @override
  void initState() {
    activeIndexes = List.generate(100, (index) => false);
    // Generate a list
    _contents = List.generate(1, (index) {
      return DragAndDropList(
        header: const Text(
          'DragAndDropList',
          style: TextStyle(fontSize: 20),
        ),
        children: List.generate(
          100,
          (index) => DragAndDropItem(
            child: ChoiceItem(
              index: index,
              text: 'Answer Item: $index',
              active: activeIndexes[index],
            ),
          ),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: DragAndDropLists(
          listPadding: const EdgeInsets.symmetric(horizontal: 32),
          onItemDraggingChanged: (item, dragging) {
            // TODO: impl callback
          },
          constrainDraggingAxis: true,
          itemDecorationWhileDragging: BoxDecoration(
            border: Border.all(
              color: const Color(0XFF395AD2),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          children: _contents,
          onItemReorder: _onItemReorder,
          onListReorder: _onListReorder,
          itemDivider: const SizedBox(height: 24),
          itemGhost: const SizedBox(height: 80),
        ),
      ),
    );
  }

  _onItemReorder(
    int oldItemIndex,
    int oldListIndex,
    int newItemIndex,
    int newListIndex,
  ) {
    setState(() {
      var movedItem = _contents[oldListIndex].children.removeAt(oldItemIndex);
      _contents[newListIndex].children.insert(newItemIndex, movedItem);
    });
  }

  _onListReorder(
    int oldListIndex,
    int newListIndex,
  ) {
    setState(() {
      var movedList = _contents.removeAt(oldListIndex);
      _contents.insert(newListIndex, movedList);
    });
  }
}
