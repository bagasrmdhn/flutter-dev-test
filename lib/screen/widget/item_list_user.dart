import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_test_sejutacita/data/model/user_model.dart';
import 'package:flutter_dev_test_sejutacita/theme/theme.dart';

class ItemUserList extends StatelessWidget {
  final Item user;
  const ItemUserList({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(color: redColor),
            child: Image.network(
                user.avatarUrl),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              user.login,
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: bold
              ),
            ),
          )
        ],
      ),
    );
  }
}
