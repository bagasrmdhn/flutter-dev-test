import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test_sejutacita/bloc/issues_bloc/issues_bloc.dart';
import 'package:flutter_dev_test_sejutacita/bloc/user_search/user_bloc.dart';
import 'package:flutter_dev_test_sejutacita/data/api/api_services.dart';
import 'package:flutter_dev_test_sejutacita/screen/ui/home_page.dart';

import 'bloc/repository_bloc/repo_bloc.dart';

void main() {
  final GithubRepository githubRepository = GithubRepository(
    GithubCache(),
    ApiServices(),
  );
  runApp(MyApp(githubRepository: githubRepository));
}

class MyApp extends StatelessWidget {
  final GithubRepository githubRepository;

  const MyApp({Key? key,required this.githubRepository}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider( create: (_) => UserBloc(githubRepository: githubRepository),),
        BlocProvider( create: (_) => IssueBloc(githubRepository: githubRepository),),
        BlocProvider( create: (_) => RepoBloc(githubRepository: githubRepository),),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

