import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';

class TestReorderablesScreen extends StatefulWidget {
  const TestReorderablesScreen({Key? key}) : super(key: key);

  @override
  State<TestReorderablesScreen> createState() => _TestReorderablesScreenState();
}

class _TestReorderablesScreenState extends State<TestReorderablesScreen> {
  List<Widget> _rows = [];

  @override
  void initState() {
    super.initState();
    _rows = List<Widget>.generate(50,
        (int index) => Text('This is sliver child $index', textScaleFactor: 2));
  }

  @override
  Widget build(BuildContext context) {
    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget row = _rows.removeAt(oldIndex);
        _rows.insert(newIndex, row);
      });
    }

    // Make sure there is a scroll controller attached to the scroll view that contains ReorderableSliverList.
    // Otherwise an error will be thrown.
    ScrollController _scrollController =
        PrimaryScrollController.of(context) ?? ScrollController();

    return Container(
      padding: const EdgeInsets.all(30),
      child: CustomScrollView(
        // A ScrollController must be included in CustomScrollView, otherwise
        // ReorderableSliverList wouldn't work
        controller: _scrollController,
        slivers: <Widget>[
          ReorderableSliverList(
            delegate: ReorderableSliverChildListDelegate(_rows),
            // or use ReorderableSliverChildBuilderDelegate if needed
//          delegate: ReorderableSliverChildBuilderDelegate(
//            (BuildContext context, int index) => _rows[index],
//            childCount: _rows.length
//          ),
            onReorder: _onReorder,
            controller: _scrollController,
          )
        ],
      ),
    );
  }
}
