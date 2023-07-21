import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ParentTabEvent {}

class ParentTabClicked extends ParentTabEvent {
  int value;
  ParentTabClicked({required this.value});
}

class ParentTabBloc extends Bloc<ParentTabEvent, int> {
  ParentTabBloc() : super(0) {
    on<ParentTabClicked>(
      (event, emit) {
        dynamic newValue = event.value;
        emit(newValue);
      },
    );
  }
}
