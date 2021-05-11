import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart' show TestWindow;

import 'simulated.dart';

class _StateContainer extends InheritedWidget {
  const _StateContainer({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final FrameManagerState data;

  @override
  bool updateShouldNotify(_StateContainer old) {
    return true;
  }
}

class FrameManager extends StatefulWidget {
  const FrameManager(
      {required this.child, required this.showsDeviceFrameFirst});
  final Widget child;
  final bool showsDeviceFrameFirst;

  @override
  FrameManagerState createState() => FrameManagerState(
        showsDeviceFrame: showsDeviceFrameFirst,
        showsFrameSwitch: showsDeviceFrameFirst,
      );

  static FrameManagerState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_StateContainer>()!.data;
  }
}

class FrameManagerState extends State<FrameManager> {
  FrameManagerState({
    required this.showsDeviceFrame,
    required this.showsFrameSwitch,
  });

  @override
  initState() {
    super.initState();
    final trueWindow = WidgetsBinding.instance!.window;

    trueDevicePixelRatio = trueWindow.devicePixelRatio;
    trueViewPadding = trueWindow.viewPadding;
    truePadding = trueWindow.padding;
  }

  bool showsFrameSwitch;
  bool showsDeviceFrame;
  late double trueDevicePixelRatio;
  late WindowPadding trueViewPadding;
  late WindowPadding truePadding;
  void setShowsDeviceFrame({required bool doShow}) {
    setState(() {
      showsDeviceFrame = doShow;
      if (!doShow) {
        final window = WidgetsBinding.instance!.window as TestWindow;
        window.devicePixelRatioTestValue = trueDevicePixelRatio;
        window.viewPaddingTestValue = trueViewPadding;
        window.paddingTestValue = truePadding;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _StateContainer(
      data: this,
      child: showsDeviceFrame
          ? Padding(
              padding: const EdgeInsets.all(4),
              child: Simulated.sample(child: widget.child),
            )
          : widget.child,
    );
  }
}
