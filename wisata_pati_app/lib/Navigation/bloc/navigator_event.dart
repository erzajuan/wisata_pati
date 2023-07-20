part of 'navigator_bloc.dart';

@immutable
abstract class NavigatorEvent {}

class NavigatePop extends NavigatorEvent {
  final BuildContext context;
  final dynamic returns;
  NavigatePop(this.context, {this.returns});
}

class NavigateToHalamanDuaTest extends NavigatorEvent {
  final BuildContext context;

  NavigateToHalamanDuaTest(this.context);
}
