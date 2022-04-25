
import 'package:equatable/equatable.dart';
import 'package:flutter_dev_test_sejutacita/data/model/repo_model.dart';

abstract class RepoState extends Equatable{
  const RepoState();

  @override
  List<Object> get props => [];
}

class RepoStateEmpty extends RepoState {}

class RepoStateLoading extends RepoState {}

class RepoStateSuccess extends RepoState {
  const RepoStateSuccess(this.items);

  final List<RepoItem> items;

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'RepoStateSuccess { items: ${items.length} }';
}

class RepoStateError extends RepoState {
  const RepoStateError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}

