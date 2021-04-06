import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart' show TestWindow;

/// A widget for fitting your app into a device frame image.
///
/// When using Simulated, please use runPkg instead of runApp. This is to ensure that the viewPadding settings are applied correctly.
///
/// ```dart
/// import 'package:flutter/material.dart';
/// import 'package:screenshot_maker/screenshot_maker.dart';
///
/// void main() {
///   runPkg(
///     Directionality(
///       textDirection: TextDirection.ltr,
///       child: Simulated(
///         innerScreenSize: const Size(1658, 3588),
///         innerScreenOffset: const Size(116, 103),
///         originalLogicalScreenSize: const Size(414, 896),
///         deviceFrameImage: Image.asset('assets/example_device_frame.png'),
///         viewPadding:
///         const PhysicalViewPadding(left: 0, top: 68, right: 0, bottom: 66),
///         child: const MyAwesomeApp(),
///       ),
///     ),
///   );
/// }
///
/// class MyAwesomeApp extends StatelessWidget {
///   const MyAwesomeApp();
///   @override
///   Widget build(BuildContext context) {
///     return MaterialApp(
///         home: Scaffold(
///             appBar: AppBar(title: Text("My Awesome App")),
///             body: ElevatedButton(child: Text('foobar'), onPressed: () {})));
///   }
/// }
/// ```
class Simulated extends StatelessWidget {
  const Simulated({
    required this.deviceFrameImage,
    required this.innerScreenSize,
    required this.innerScreenOffset,
    required this.viewPadding,
    required this.originalLogicalScreenSize,
    this.locale,
    required this.child,
    Key? key,
  }) : super(key: key);

  /// By using this constructor, you can use a very simple sample device frame image.
  /// It is not recommended to use this for the actual screenshots for the store.
  const Simulated.sample({required this.child, this.locale, Key? key})
      : deviceFrameImage = const Image(
            image: AssetImage(
          'assets/sample_device_frame.png',
        )),
        innerScreenSize = const Size(1658, 3588),
        innerScreenOffset = const Size(116, 103),
        originalLogicalScreenSize = const Size(414, 896),
        viewPadding =
            const PhysicalViewPadding(left: 0, top: 68, right: 0, bottom: 66),
        super(key: key);

  /// An Image widget to display the image of the device you want to combine.
  final Image deviceFrameImage;

  /// The size of the screen in the device image.
  final Size innerScreenSize;

  /// The offset from the top left corner to the screen in the device image.
  final Size innerScreenOffset;

  /// The number of original LOGICAL pixels of the device being used as the device image.
  final Size originalLogicalScreenSize;

  /// The part of the display that is partially hidden by the system UI.
  /// This allows you to represent parts of the display that are hidden by the hardware display "notch" or the system status bar.
  final PhysicalViewPadding viewPadding;

  /// If you want to specify the language settings of the device to be reproduced, set this argument.
  final Locale? locale;

  /// Your app for combining with the device image.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!(WidgetsBinding.instance!.window is TestWindow)) {
      throw StateError(
          'When you use Simulated, you need to use runPkg instead of runApp.');
    }
    final testWindow = WidgetsBinding.instance!.window as TestWindow;
    testWindow.devicePixelRatioTestValue =
        innerScreenSize.height / originalLogicalScreenSize.height;
    testWindow.viewPaddingTestValue = viewPadding;
    testWindow.paddingTestValue = viewPadding;
    testWindow.localeTestValue = locale ?? testWindow.locale;

    return FittedBox(
      child: Stack(children: [
        Padding(
          padding: EdgeInsets.only(
            left: innerScreenOffset.width,
            top: innerScreenOffset.height,
          ),
          child: SizedBox(
            width: innerScreenSize.width,
            height: innerScreenSize.height,
            child: FittedBox(
              alignment: Alignment.topLeft,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: originalLogicalScreenSize.width,
                  maxWidth: originalLogicalScreenSize.width,
                  minHeight: originalLogicalScreenSize.height,
                  maxHeight: originalLogicalScreenSize.height,
                ),
                child: ClipRect(child: child),
              ),
            ),
          ),
        ),
        IgnorePointer(child: deviceFrameImage),
      ]),
    );
  }
}

class PhysicalViewPadding implements ui.WindowPadding {
  const PhysicalViewPadding(
      {required this.left,
      required this.top,
      required this.right,
      required this.bottom});
  @override
  final double left;
  @override
  final double top;
  @override
  final double right;
  @override
  final double bottom;
}

/// When using Simulated, please use runPkg instead of runApp. This is to ensure that the viewPadding settings are applied correctly.
void runPkg(Widget app) {
  final _binding = _WidgetsFlutterBindingWithTestWindow.ensureInitialized();
  _binding
    ..scheduleAttachRootWidget(app)
    ..scheduleWarmUpFrame();
}

/// This class is used to override the settings of the Window used by Flutter with TestWindow.
class _WidgetsFlutterBindingWithTestWindow extends WidgetsFlutterBinding {
  _WidgetsFlutterBindingWithTestWindow._();
  factory _WidgetsFlutterBindingWithTestWindow.ensureInitialized() {
    if (WidgetsBinding.instance == null) {
      _WidgetsFlutterBindingWithTestWindow._();
    }
    return WidgetsBinding.instance! as _WidgetsFlutterBindingWithTestWindow;
  }

  @override
  void scheduleAttachRootWidget(Widget rootWidget) {
    Timer.run(() {
      attachRootWidget(rootWidget);
    });
  }

  TestWindow? _customWindow;

  @override
  TestWindow get window {
    return _customWindow ??= TestWindow(window: ui.window);
  }
}
