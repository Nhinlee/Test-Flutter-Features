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
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: controller,
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Ordering Question',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                '''Why do we use it?
It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).''',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SliverReorderableList(
            itemBuilder: (context, index) {
              return ReorderableDragStartListener(
                index: index,
                key: Key('Drag item: $index'),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ChoiceItem(
                    index: index,
                    text: 'Answer item: ${_items[index]}',
                  ),
                ),
              );

              return Padding(
                key: Key('Answer item: $index'),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ChoiceItem(
                  index: index,
                  text: 'Answer item: ${_items[index]}',
                ),
              );
            },
            itemCount: _items.length,
            onReorder: _onReorder,
            proxyDecorator: _proxyDecorator,
          ),
        ],
      ),
    );
  }

  _onReorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex--;
    }
    setState(() {
      final int item = _items.removeAt(oldIndex);
      _items.insert(newIndex, item);
    });
  }

  Widget _proxyDecorator(Widget child, int index, Animation<double> animation) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ChoiceItem(
        index: index,
        text: 'Answer item: ${_items[index]}',
        active: true,
      ),
    );
  }
}
