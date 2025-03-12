import 'package:equatable/equatable.dart';

abstract class ApiEvents extends Equatable {
  const ApiEvents();

  @override
  List<Object?> get props => [];
}

class FetchData extends ApiEvents {}

class FilterData extends ApiEvents {
  final String stSearch;

  const FilterData(this.stSearch);
}
