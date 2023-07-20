part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashScreenState {}

class SplashScreenInitial extends SplashScreenState {}

class SplashScreenAuthenticated extends SplashScreenState {}

class SplashScreenUnAuthenticated extends SplashScreenState {}
