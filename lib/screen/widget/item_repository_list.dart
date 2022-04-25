import 'package:flutter/material.dart';
import 'package:flutter_dev_test_sejutacita/data/model/repo_model.dart';
import 'package:flutter_dev_test_sejutacita/theme/theme.dart';

class ItemRepoList extends StatelessWidget {
  final RepoItem repo;

  const ItemRepoList({Key? key, required this.repo}) : super(key: key);

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
            child: Image.network(repo.owner.avatarUrl),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  child: Text(
                    repo.name,
                    style:
                        blackTextStyle.copyWith(fontSize: 14, fontWeight: bold),
                  ),
                ),
                Container(
                  width: 80,
                  child: Text(
                    'Created at ${repo.createdAt.year.toString()}',
                    style: blackTextStyle.copyWith(
                        fontSize: 12, fontWeight: medium),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text.rich(
                  TextSpan(
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold
                    ),
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Icon(
                              Icons.remove_red_eye,
                          size: 12.0,),
                        ),
                      ),
                      TextSpan(
                        text: repo.watchersCount.toString(),
                      )
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold
                    ),
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Icon(
                              Icons.star,
                          size: 12.0,),
                        ),
                      ),
                      TextSpan(
                        text: repo.stargazersCount.toString(),
                      )
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold
                    ),
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Icon(
                              Icons.mediation,
                          size: 12.0,),
                        ),
                      ),
                      TextSpan(
                        text: repo.watchersCount.toString(),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
