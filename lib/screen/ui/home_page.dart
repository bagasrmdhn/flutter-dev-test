import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test_sejutacita/bloc/issues_bloc/issues_bloc.dart';
import 'package:flutter_dev_test_sejutacita/bloc/issues_bloc/issues_state.dart';
import 'package:flutter_dev_test_sejutacita/bloc/repository_bloc/repo_bloc.dart';
import 'package:flutter_dev_test_sejutacita/bloc/repository_bloc/repo_state.dart';
import 'package:flutter_dev_test_sejutacita/bloc/user_search/user_bloc.dart';
import 'package:flutter_dev_test_sejutacita/bloc/user_search/user_state.dart';
import 'package:flutter_dev_test_sejutacita/screen/widget/issues_search.dart';
import 'package:flutter_dev_test_sejutacita/screen/widget/repo_search.dart';
import 'package:flutter_dev_test_sejutacita/screen/widget/repo_search_result.dart';
import 'package:flutter_dev_test_sejutacita/screen/widget/search_bar.dart';
import 'package:flutter_dev_test_sejutacita/screen/widget/user_search_result.dart';
import 'package:flutter_dev_test_sejutacita/screen/widget/issues_search_result.dart';
import 'package:flutter_dev_test_sejutacita/theme/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var index = _tabController.index;
    Widget tabBar() {
      return DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: redColor, borderRadius: BorderRadius.circular(20)),
                child: TabBar(
                    onTap: (tabIndex) {
                      setState(() {
                        index = tabIndex;
                      });
                    },
                    controller: _tabController,
                    labelColor: redColor,
                    unselectedLabelColor: whiteColor,
                    indicator: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(100)),
                    tabs: const [
                      Tab(text: 'User'),
                      Tab(text: 'Issues'),
                      Tab(text: 'Repository'),
                    ]),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: lightRedColor,
              expandedHeight: 70.0,
              floating: true,
              snap: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: <Widget>[
                    const SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Builder(builder: (context) {
                        return Container(
                            height: 31.0,
                            width: double.infinity,
                            child: Builder(builder: (context) {
                              if (index == 0) {
                                return SearchBar();
                              } else if (index == 1) {
                                return IssueSearchBar();
                              } else {
                                return RepoSearch();
                              }
                            }));
                      }),
                    ),
                  ],
                ),
              ),
            ),
            SliverAppBar(
              backgroundColor: lightRedColor,
              expandedHeight: 80,
              pinned: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(46.0),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: tabBar(),
                ),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                controller: _tabController,
                children: [
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserStateLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is UserStateError) {
                        return Text(state.error);
                      }
                      if (state is UserStateSuccess) {
                        return state.items.isEmpty
                            ? const Text('No Results')
                            : SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    UserSearchResults(items: state.items),
                                  ],
                                ),
                              );
                      }
                      return Text('');
                    },
                  ),
                  BlocBuilder<IssueBloc, IssueState>(
                    builder: (context, state) {
                      if (state is IssueStateLoading) {
                        return const Center(child:  CircularProgressIndicator());
                      }
                      if (state is IssueStateError) {
                        return Text(state.error);
                      }
                      if (state is IssueStateSuccess) {
                        return state.items.isEmpty
                            ? const Text('No Results')
                            : SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IssueSearchResults(items: state.items),
                                  ],
                                ),
                              );
                      }
                      return Text('');
                    },
                  ),
                  BlocBuilder<RepoBloc, RepoState>(
                    builder: (context, state) {
                      if (state is RepoStateLoading) {
                        return const Center(child:  CircularProgressIndicator());
                      }
                      if (state is RepoStateError) {
                        return Text(state.error);
                      }
                      if (state is RepoStateSuccess) {
                        return state.items.isEmpty
                            ? const Text('No Results')
                            : SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RepoSearchResults(items: state.items),
                            ],
                          ),
                        );
                      }
                      return Text('');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
