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
  final Datum data;

  NavigateToVirtual(this.context, this.data);
}

class NavigateToHome extends NavigatorEvent {
  final BuildContext context;

  NavigateToHome(this.context);
}

class NavigateToDetailWisata extends NavigatorEvent {
  final BuildContext context;
  final int index;

  NavigateToDetailWisata(this.context, this.index);
}
