import 'package:equatable/equatable.dart';
import 'package:wisata_pati_app/detail/models/datum/datum.dart';

abstract class DetailState extends Equatable {}

class DetailLoadingState extends DetailState {
  @override
  List<Object?> get props => [];
}

class DetailErrorState extends DetailState {
  DetailErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}

class DetailLoadedState extends DetailState {
  DetailLoadedState(this.data);
  final List<Datum>? data;

  @override
  List<Object?> get props => [data];
}
