import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TemplateScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final AlignmentDirectional persistentFooterAlignment =
      AlignmentDirectional.centerEnd;
  final Widget? drawer;
  final void Function(bool)? onDrawerChanged;
  final Widget? endDrawer;
  final void Function(bool)? onEndDrawerChanged;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool primary = true;
  final DragStartBehavior drawerDragStartBehavior = DragStartBehavior.start;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final String? restorationId;

  const TemplateScaffold(
      {super.key,
      this.appBar,
      this.body,
      this.extendBody = false,
      this.extendBodyBehindAppBar = false,
      this.drawerEnableOpenDragGesture = true,
      this.endDrawerEnableOpenDragGesture = true,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.bottomNavigationBar,
      this.floatingActionButtonAnimator,
      this.persistentFooterButtons,
      this.drawer,
      this.onDrawerChanged,
      this.endDrawer,
      this.onEndDrawerChanged,
      this.bottomSheet,
      this.backgroundColor,
      this.resizeToAvoidBottomInset,
      this.drawerScrimColor,
      this.drawerEdgeDragWidth,
      this.restorationId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: body,
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButtonLocation: floatingActionButtonLocation,
        floatingActionButtonAnimator: floatingActionButtonAnimator,
        persistentFooterButtons: persistentFooterButtons,
        persistentFooterAlignment: persistentFooterAlignment,
        drawer: drawer,
        onDrawerChanged: onDrawerChanged,
        endDrawer: endDrawer,
        onEndDrawerChanged: onEndDrawerChanged,
        bottomSheet: bottomSheet,
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        primary: primary,
        drawerDragStartBehavior: drawerDragStartBehavior,
        extendBody: extendBody,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        drawerScrimColor: drawerScrimColor,
        drawerEdgeDragWidth: drawerEdgeDragWidth,
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
        endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
        restorationId: restorationId,
      ),
    );
  }
}
