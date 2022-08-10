import 'package:equatable/equatable.dart';

class CityState extends Equatable {
  final String? query;

  const CityState._({
    this.query,
  });

  const CityState.initial() : this._();

  CityState copyWith({
    String? query,
  }) {
    return CityState._(
      query: query ?? this.query,
    );
  }

  @override
  List<Object?> get props => [
        query,
      ];
}
