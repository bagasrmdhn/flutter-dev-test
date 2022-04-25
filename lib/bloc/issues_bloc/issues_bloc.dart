
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test_sejutacita/data/api/api_services.dart';
import 'package:flutter_dev_test_sejutacita/data/model/issues_model.dart';

import 'package:stream_transform/stream_transform.dart';

import 'issues_event.dart';
import 'issues_state.dart';


const _duration = const Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class IssueBloc extends Bloc<IssueEvent, IssueState> {
  IssueBloc({required this.githubRepository})
      : super(IssueStateEmpty()) {
    on<IssueFetched>(_onIssueFetched, transformer: debounce(_duration));
  }

  final GithubRepository githubRepository;

  void _onIssueFetched(
      IssueFetched event,
      Emitter<IssueState> emit,
      ) async {
    final searchTerm = event.query;

    if (searchTerm.isEmpty) return emit(IssueStateEmpty());

    emit(IssueStateLoading());

    try {
      final results = await githubRepository.searchIssue(searchTerm);
      emit(IssueStateSuccess(results.items));
    } catch (error) {
      emit(error is SearchResultError
          ? IssueStateError(error.message)
          : IssueStateError('something went wrong'));
    }
  }
}
