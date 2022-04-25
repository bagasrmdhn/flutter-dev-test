import 'package:flutter/material.dart';
import 'package:flutter_dev_test_sejutacita/data/model/issues_model.dart';
import 'package:flutter_dev_test_sejutacita/theme/theme.dart';

class ItemIssuesList extends StatelessWidget {
  const ItemIssuesList({Key? key, required this.issue}) : super(key: key);
  final IssueItem issue;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            child: Image.network(
              issue.user.avatarUrl,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  child: Text(
                    issue.title,
                    style:
                        blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                  ),
                ),
                Text(

                  'Last update at ${issue.updatedAt.toLocal().toString()}',
                  style:
                      blackTextStyle.copyWith(fontSize: 10, fontWeight: medium),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            width: 50,
            child: Text(
              issue.state,
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: semiBold,color: lightRedColor),
            ),
          ),
        ],
      ),
    );
  }
}
