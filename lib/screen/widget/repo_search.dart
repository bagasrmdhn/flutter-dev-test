
import 'package:flutter/material.dart';
import 'package:flutter_dev_test_sejutacita/bloc/repository_bloc/repo_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test_sejutacita/bloc/repository_bloc/repo_event.dart';
import 'package:flutter_dev_test_sejutacita/theme/theme.dart';

class RepoSearch extends StatefulWidget {
  const RepoSearch({Key? key}) : super(key: key);

  @override
  State<RepoSearch> createState() => RepoSearchState();
}

class RepoSearchState extends State<RepoSearch> {
  final _textController = TextEditingController();
  late RepoBloc _githubSearchBloc;


  @override
  void initState() {
    super.initState();
    _githubSearchBloc = context.read<RepoBloc>();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: whiteColor,
      ),
      child: TextField(
        controller: _textController,
        autocorrect: false,
        onChanged: (query) {
          _githubSearchBloc.add(
            RepoFetched(query: query),
          );
          // print('current index : ${DefaultTabController.of(context)?.index}!');
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: redColor),
          suffixIcon: GestureDetector(
            onTap: _onClearTapped,
            child: Icon(Icons.clear, color: redColor),
          ),
          border: InputBorder.none,
          hintText: 'Search Here',
        ),
      ),
    );
  }

  void _onClearTapped() {
    _textController.text = '';
    _githubSearchBloc.add(const RepoFetched(query: ''));
  }
}
