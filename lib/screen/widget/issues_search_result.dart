
import 'package:flutter/cupertino.dart';
import 'package:flutter_dev_test_sejutacita/data/model/issues_model.dart';

import 'item_issues_list.dart';

class IssueSearchResults extends StatelessWidget {
  const IssueSearchResults({Key? key, required this.items}) : super(key: key);

  final List<IssueItem> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemIssuesList(issue: items[index]);
        },
      ),
    );
  }
}
