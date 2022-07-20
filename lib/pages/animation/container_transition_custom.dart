// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

const String _loremIpsumParagraph =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
    'tempor incididunt ut labore et dolore magna aliqua. Vulputate dignissim '
    'amet commodo nulla. Pretium viverra suspendisse potenti nullam ac tortor ';
const double _fabDimension = 56.0;

/// The demo page for [OpenContainerTransform].
class OpenContainerTransformCustomDemo extends StatefulWidget {
  /// Creates the demo page for [OpenContainerTransform].
  const OpenContainerTransformCustomDemo({Key? key}) : super(key: key);

  @override
  _OpenContainerTransformCustomDemoState createState() {
    return _OpenContainerTransformCustomDemoState();
  }
}

class _OpenContainerTransformCustomDemoState
    extends State<OpenContainerTransformCustomDemo> {
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  void _showMarkedAsDoneSnackbar(bool? isMarkedAsDone) {
    if (isMarkedAsDone ?? false)
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Marked as done!'),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Container transform'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            _OpenContainerWrapper(
              transitionType: _transitionType,
              closedBuilder: (BuildContext _, VoidCallback openContainer) {
                return _ExampleCard(openContainer: openContainer);
              },
              onClosed: _showMarkedAsDoneSnackbar,
            ),
            const SizedBox(height: 16.0),
            _OpenContainerWrapper(
              transitionType: _transitionType,
              closedBuilder: (BuildContext _, VoidCallback openContainer) {
                return _ExampleSingleTile(openContainer: openContainer);
              },
              onClosed: _showMarkedAsDoneSnackbar,
            ),
            const SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: _OpenContainerWrapper(
                    transitionType: _transitionType,
                    closedBuilder:
                        (BuildContext _, VoidCallback openContainer) {
                      return _SmallerCard(
                        openContainer: openContainer,
                        subtitle: 'Secondary text',
                      );
                    },
                    onClosed: _showMarkedAsDoneSnackbar,
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: _OpenContainerWrapper(
                    transitionType: _transitionType,
                    closedBuilder:
                        (BuildContext _, VoidCallback openContainer) {
                      return _SmallerCard(
                        openContainer: openContainer,
                        subtitle: 'Secondary text',
                      );
                    },
                    onClosed: _showMarkedAsDoneSnackbar,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: _OpenContainerWrapper(
                    transitionType: _transitionType,
                    closedBuilder:
                        (BuildContext _, VoidCallback openContainer) {
                      return _SmallerCard(
                        openContainer: openContainer,
                        subtitle: 'Secondary',
                      );
                    },
                    onClosed: _showMarkedAsDoneSnackbar,
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: _OpenContainerWrapper(
                    transitionType: _transitionType,
                    closedBuilder:
                        (BuildContext _, VoidCallback openContainer) {
                      return _SmallerCard(
                        openContainer: openContainer,
                        subtitle: 'Secondary',
                      );
                    },
                    onClosed: _showMarkedAsDoneSnackbar,
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: _OpenContainerWrapper(
                    transitionType: _transitionType,
                    closedBuilder:
                        (BuildContext _, VoidCallback openContainer) {
                      return _SmallerCard(
                        openContainer: openContainer,
                        subtitle: 'Secondary',
                      );
                    },
                    onClosed: _showMarkedAsDoneSnackbar,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ...List<Widget>.generate(10, (int index) {
              return OpenContainer<bool>(
                transitionType: _transitionType,
                openBuilder: (BuildContext _, VoidCallback openContainer) {
                  return const _DetailsPage();
                },
                onClosed: _showMarkedAsDoneSnackbar,
                tappable: false,
                closedShape: const RoundedRectangleBorder(),
                closedElevation: 0.0,
                closedBuilder: (BuildContext _, VoidCallback openContainer) {
                  return ListTile(
                    leading: Image.asset(
                      'assets/images/avatar_logo.png',
                      width: 40,
                    ),
                    onTap: openContainer,
                    title: Text('List item ${index + 1}'),
                    subtitle: const Text('Secondary text'),
                  );
                },
              );
            }),
          ],
        ));
  }
}

class _OpenContainerWrapper extends StatelessWidget {
  const _OpenContainerWrapper({
    required this.closedBuilder,
    required this.transitionType,
    required this.onClosed,
  });

  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final ClosedCallback<bool?> onClosed;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return const _DetailsPage();
      },
      onClosed: onClosed,
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}

class _ExampleCard extends StatelessWidget {
  const _ExampleCard({required this.openContainer});

  final VoidCallback openContainer;

  @override
  Widget build(BuildContext context) {
    return _InkWellOverlay(
      openContainer: openContainer,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.black38,
              child: Center(
                child: Image.asset(
                  'assets/images/placeholder_image.png',
                  width: 100,
                ),
              ),
            ),
          ),
          const ListTile(
            title: Text('Title'),
            subtitle: Text('Secondary text'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur '
              'adipiscing elit, sed do eiusmod tempor.',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallerCard extends StatelessWidget {
  const _SmallerCard({
    required this.openContainer,
    required this.subtitle,
  });

  final VoidCallback openContainer;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return _InkWellOverlay(
      openContainer: openContainer,
      height: 225,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.black38,
            height: 150,
            child: Center(
              child: Image.asset(
                'assets/images/placeholder_image.png',
                width: 80,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Title',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExampleSingleTile extends StatelessWidget {
  const _ExampleSingleTile({required this.openContainer});

  final VoidCallback openContainer;

  @override
  Widget build(BuildContext context) {
    const double height = 100.0;

    return _InkWellOverlay(
      openContainer: openContainer,
      height: height,
      child: Row(
        children: <Widget>[
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

class _InkWellOverlay extends StatelessWidget {
  const _InkWellOverlay({
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

class _DetailsPage extends StatelessWidget {
  const _DetailsPage({this.includeMarkAsDoneButton = true});

  final bool includeMarkAsDoneButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details page'),
        actions: <Widget>[
          if (includeMarkAsDoneButton)
            IconButton(
              icon: const Icon(Icons.done),
              onPressed: () => Navigator.pop(context, true),
              tooltip: 'Mark as done',
            )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.black38,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(70.0),
              child: Image.asset(
                'assets/images/placeholder_image.png',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Title',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.black54,
                        fontSize: 30.0,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  _loremIpsumParagraph,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.black54,
                        height: 1.5,
                        fontSize: 16.0,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
