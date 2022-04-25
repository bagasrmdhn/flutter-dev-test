
import 'package:equatable/equatable.dart';
import 'package:flutter_dev_test_sejutacita/data/model/user_model.dart';

abstract class UserState extends Equatable{
  const UserState();

  @override
  List<Object> get props => [];
}

class UserStateEmpty extends UserState {}

class UserStateLoading extends UserState {}

class UserStateSuccess extends UserState {
  const UserStateSuccess(this.items);

  final List<Item> items;

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'UserStateSuccess { items: ${items.length} }';
}

class UserStateError extends UserState {
  const UserStateError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}

