
import 'package:equatable/equatable.dart';

abstract class RepoEvent extends Equatable {
  const RepoEvent();
}

class RepoFetched extends RepoEvent {
  const RepoFetched({required this.query});

  final String query;

  @override
  List<Object?> get props => [query];

  @override
  String toString() => 'RepoFetched{query: $query}';
}
