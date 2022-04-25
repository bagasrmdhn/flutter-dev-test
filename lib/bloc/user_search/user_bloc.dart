
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test_sejutacita/bloc/user_search/user_event.dart';
import 'package:flutter_dev_test_sejutacita/bloc/user_search/user_state.dart';
import 'package:flutter_dev_test_sejutacita/data/api/api_services.dart';
import 'package:flutter_dev_test_sejutacita/data/model/user_model.dart';

import 'package:stream_transform/stream_transform.dart';


const _duration = const Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required this.githubRepository})
      : super(UserStateEmpty()) {
    on<UserFetched>(_onUserFetched, transformer: debounce(_duration));
  }

  final GithubRepository githubRepository;

  void _onUserFetched(
      UserFetched event,
      Emitter<UserState> emit,
      ) async {
    final searchTerm = event.query;

    if (searchTerm.isEmpty) return emit(UserStateEmpty());

    emit(UserStateLoading());

    try {
      final results = await githubRepository.searchUser(searchTerm);
      emit(UserStateSuccess(results.items));
    } catch (error) {
      emit(error is SearchResultError
          ? UserStateError(error.message)
          : UserStateError('something went wrong'));
    }
  }
}
