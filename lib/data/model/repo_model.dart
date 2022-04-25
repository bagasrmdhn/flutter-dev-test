import 'dart:convert';

RepoResponse repoResponseFromJson(String str) => RepoResponse.fromJson(json.decode(str));

String repoResponseToJson(RepoResponse data) => json.encode(data.toJson());

class RepoResponse {
  RepoResponse({
    required this.items,
  });

  final List<RepoItem> items;

  factory RepoResponse.fromJson(Map<String, dynamic> json) => RepoResponse(
    items: List<RepoItem>.from(json["items"].map((x) => RepoItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class RepoItem {
  RepoItem({
    required this.name,
    required this.createdAt,
    required this.owner,
    required this.stargazersCount,
    required this.watchersCount,
    required this.forksCount,
  });

  final String name;
  final DateTime createdAt;
  final Owner owner;
  final int stargazersCount;
  final int watchersCount;
  final int forksCount;

  factory RepoItem.fromJson(Map<String, dynamic> json) => RepoItem(
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    owner: Owner.fromJson(json["owner"]),
    stargazersCount: json["stargazers_count"],
    watchersCount: json["watchers_count"],
    forksCount: json["forks_count"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "created_at": createdAt.toIso8601String(),
    "owner": owner.toJson(),
    "stargazers_count": stargazersCount,
    "watchers_count": watchersCount,
    "forks_count": forksCount,
  };
}

class Owner {
  Owner({
    required this.avatarUrl,
  });

  final String avatarUrl;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
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
