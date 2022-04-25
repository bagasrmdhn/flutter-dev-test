
import 'dart:convert';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  UserResponse({
    required this.items,
  });

  final List<Item> items;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    required this.login,
    required this.id,
    required this.avatarUrl,
  });

  final String login;
  final int id;
  final String avatarUrl;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    login: json["login"],
    id: json["id"],
    avatarUrl: json["avatar_url"],
  );

  Map<String, dynamic> toJson() => {
    "login": login,
    "id": id,
    "avatar_url": avatarUrl,
  };
}



class SearchResultError {
  const SearchResultError({required this.message});

  final String message;

  static SearchResultError fromJson(dynamic json) {
    return SearchResultError(
      message: json['message'] as String,
    );
  }
}

