import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test_sejutacita/bloc/user_search/user_event.dart';
import 'package:flutter_dev_test_sejutacita/bloc/user_search/user_bloc.dart';
import 'package:flutter_dev_test_sejutacita/theme/theme.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => SearchBarState();
}

class SearchBarState extends State<SearchBar> {
  final _textController = TextEditingController();
  late UserBloc _githubSearchBloc;


  @override
  void initState() {
    super.initState();
    _githubSearchBloc = context.read<UserBloc>();
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
            UserFetched(query: query),
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
    _githubSearchBloc.add(const UserFetched(query: ''));
  }
}
