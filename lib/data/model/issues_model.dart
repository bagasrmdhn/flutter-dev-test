
import 'dart:convert';

IssueResponse userResponseFromJson(String str) => IssueResponse.fromJson(json.decode(str));

String userResponseToJson(IssueResponse data) => json.encode(data.toJson());

class IssueResponse {
  IssueResponse({
    required this.items,
  });

  final List<IssueItem> items;

  factory IssueResponse.fromJson(Map<String, dynamic> json) => IssueResponse(
    items: List<IssueItem>.from(json["items"].map((x) => IssueItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class IssueItem {
  IssueItem({
    required this.title,
    required this.state,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });

  final String title;
  final String state;
  final User user;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory IssueItem.fromJson(Map<String, dynamic> json) => IssueItem(
    title: json["title"],
    state: json["state"],
    user: User.fromJson(json["user"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "state": state,
    "user": user.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class User {
  User({
    required this.avatarUrl,
  });

  final String avatarUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
    avatarUrl: json["avatar_url"],
  );

  Map<String, dynamic> toJson() => {
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


