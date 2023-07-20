part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashScreenEvent extends Equatable {}

class SplashScreenStarted extends SplashScreenEvent {
  @override
  List<Object?> get props => [];
}
