part of 'navigator_bloc.dart';

@immutable
abstract class NavigatorEvent {}

class NavigatePop extends NavigatorEvent {
  final BuildContext context;
  final dynamic returns;
  NavigatePop(this.context, {this.returns});
}

class NavigateToParentTab extends NavigatorEvent {
  final BuildContext context;

  NavigateToParentTab(this.context);
}

class NavigateToVirtual extends NavigatorEvent {
  final BuildContext context;

  NavigateToVirtual(this.context);
}
