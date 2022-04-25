
import 'package:equatable/equatable.dart';
import 'package:flutter_dev_test_sejutacita/data/model/issues_model.dart';

abstract class IssueState extends Equatable{
  const IssueState();

  @override
  List<Object> get props => [];
}

class IssueStateEmpty extends IssueState {}

class IssueStateLoading extends IssueState {}

class IssueStateSuccess extends IssueState {
  const IssueStateSuccess(this.items);

  final List<IssueItem> items;

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'IssueStateSuccess { items: ${items.length} }';
}

class IssueStateError extends IssueState {
  const IssueStateError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}

