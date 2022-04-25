import 'package:equatable/equatable.dart';

abstract class IssueEvent extends Equatable {
  const IssueEvent();
}

class IssueFetched extends IssueEvent {
  const IssueFetched({required this.query});

  final String query;

  @override
  List<Object?> get props => [query];

  @override
  String toString() => 'IssueFetched{query: $query}';
}
