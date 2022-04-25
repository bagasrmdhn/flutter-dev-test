
import 'package:flutter/cupertino.dart';
import 'package:flutter_dev_test_sejutacita/data/model/user_model.dart';
import 'package:flutter_dev_test_sejutacita/screen/widget/item_list_user.dart';

class UserSearchResults extends StatelessWidget {
  const UserSearchResults({Key? key, required this.items}) : super(key: key);

  final List<Item> items;

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
          return ItemUserList(user: items[index]);
        },
      ),
    );
  }
}
