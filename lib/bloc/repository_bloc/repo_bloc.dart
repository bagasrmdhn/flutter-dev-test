import 'package:flutter_dev_test_sejutacita/bloc/repository_bloc/repo_event.dart';
import 'package:flutter_dev_test_sejutacita/bloc/repository_bloc/repo_state.dart';
import 'package:flutter_dev_test_sejutacita/data/api/api_services.dart';
import 'package:flutter_dev_test_sejutacita/data/model/repo_model.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _duration = const Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class RepoBloc extends Bloc<RepoEvent, RepoState> {
  RepoBloc({required this.githubRepository})
      : super(RepoStateEmpty()) {
    on<RepoFetched>(_onRepoFetched, transformer: debounce(_duration));
  }

  final GithubRepository githubRepository;

  void _onRepoFetched(
      RepoFetched event,
      Emitter<RepoState> emit,
      ) async {
    final searchTerm = event.query;

    if (searchTerm.isEmpty) return emit(RepoStateEmpty());

    emit(RepoStateLoading());

    try {
      final results = await githubRepository.searchRepo(searchTerm);
      emit(RepoStateSuccess(results.items));
    } catch (error) {
      emit(error is SearchResultError
          ? RepoStateError(error.message)
          : RepoStateError('something went wrong'));
    }
  }
}
