import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<SplashScreenStarted>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 1500), () {
        emit(SplashScreenAuthenticated());
      });
    });
  }
}
