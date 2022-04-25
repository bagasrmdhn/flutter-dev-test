
import 'package:flutter/cupertino.dart';
import 'package:flutter_dev_test_sejutacita/data/model/repo_model.dart';
import 'package:flutter_dev_test_sejutacita/screen/widget/item_repository_list.dart';

class RepoSearchResults extends StatelessWidget {
  const RepoSearchResults({Key? key, required this.items}) : super(key: key);

  final List<RepoItem> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemRepoList(repo: items[index]);
        },
      ),
    );
  }
}