part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadInProgress extends HomeState {}

class HomeLoadSuccess extends HomeState {
  final List<Datum> data;

  HomeLoadSuccess(this.data);
}

class HomeLoadFailure extends HomeState {
  final String message;

  HomeLoadFailure(this.message);
}
