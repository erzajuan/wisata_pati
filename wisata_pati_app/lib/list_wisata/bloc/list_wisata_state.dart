import 'package:equatable/equatable.dart';
import 'package:wisata_pati_app/detail/models/datum/datum.dart';

abstract class ListWisataState extends Equatable {}

class ListWisataLoadingState extends ListWisataState {
  @override
  List<Object?> get props => [];
}

class ListWisataErrorState extends ListWisataState {
  ListWisataErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}

class ListWisataLoadedState extends ListWisataState {
  ListWisataLoadedState(this.data);
  final List<Datum>? data;

  @override
  List<Object?> get props => [data];
}
