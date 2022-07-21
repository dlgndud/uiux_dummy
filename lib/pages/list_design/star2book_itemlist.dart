// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:uiux_dummy/pages/list_design/open_content_wrapper.dart';

class Star2BookItemList extends StatefulWidget {
  const Star2BookItemList({Key? key}) : super(key: key);

  @override
  State<Star2BookItemList> createState() => _Star2BookItemListState();
}

class _Star2BookItemListState extends State<Star2BookItemList> {
  @override
  Widget build(BuildContext context) {
    // snackbar message
    void _showMarkedAsDoneSnackbar(bool? isMarkedAsDone) {
      if (isMarkedAsDone ?? false)
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Marked as done!'),
        ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Item'),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (ctx, idx) {
            return OpenContentWrapper(
                closedBuilder: (BuildContext _, VoidCallback openContainer) {
                  return ItemWidget(openContainer: openContainer);
                },
                transitionType: ContainerTransitionType.fade,
                onClosed: _showMarkedAsDoneSnackbar);
          },
          itemCount: 10,
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  ItemWidget({required this.openContainer});

  final VoidCallback openContainer;

  @override
  Widget build(BuildContext context) {
    const double height = 100.0;

    return _InkWellWrapper(
      openContainer: openContainer,
      height: height,
      child: Row(
        children: [
          Container(
            color: Colors.black38,
            height: height,
            width: height,
            child: Center(
              child: Image.asset(
                'assets/images/placeholder_image.png',
                width: 60,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Title',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(height: 8),
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur '
                      'adipiscing elit,',
                      style: Theme.of(context).textTheme.caption),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InkWellWrapper extends StatelessWidget {
  const _InkWellWrapper({
    this.openContainer,
    this.height,
    this.child,
  });

  final VoidCallback? openContainer;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: null,
      child: InkWell(
        onTap: openContainer,
        child: child,
      ),
    );
  }
}
