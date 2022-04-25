import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserFetched extends UserEvent {
  const UserFetched({required this.query});

  final String query;

  @override
  List<Object?> get props => [query];

  @override
  String toString() => 'UserFetched{query: $query}';
}


