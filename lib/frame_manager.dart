import 'package:flutter/material.dart';

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
  bool showsFrameSwitch;
  bool showsDeviceFrame;
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
