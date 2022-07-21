import 'package:flutter/material.dart';

class SliverTutorial extends StatefulWidget {
  const SliverTutorial({Key? key}) : super(key: key);

  @override
  State<SliverTutorial> createState() => _SliverTutorialState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _SliverTutorialState extends State<SliverTutorial> {
  final _controller = ScrollController();
  double _offset = 0;
  double _opacity = 1;

  @override
  void initState() {
    _controller.addListener(onScroll);
    super.initState();
  }

  void onScroll() {
    setState(() {
      _offset = (_controller.hasClients) ? _controller.offset : 0;
      if (100 > _offset && _offset > 1) {
        setState(() {
          _opacity = _offset / 100;
        });
      } else if (_offset > 100 && _opacity != 1) {
        _opacity = 1;
      } else if (_offset < 0 && _opacity != 0) {
        _opacity = 0;
      }
    });
    print("opacity is: $_opacity, offset is : $_offset");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      controller: _controller,
      slivers: [
        SliverOpacity(
          opacity: _opacity,
          sliver: SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverAppBar'),
              background: FlutterLogo(),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: List.generate(
                10,
                (index) => Card(
                      child: ListTile(
                        title: Text('$index'),
                      ),
                    )),
          ),
        ),
      ],
    ));
  }
}
