import 'dart:convert';
import 'dart:io';
import 'package:flutter_dev_test_sejutacita/data/api/url.dart';
import 'package:flutter_dev_test_sejutacita/data/model/issues_model.dart';
import 'package:flutter_dev_test_sejutacita/data/model/repo_model.dart';
import 'package:flutter_dev_test_sejutacita/data/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<UserResponse> searchUser(String query) async {
    final response = await http.get(
      Uri.parse(
        UrlApi.user + query,
      ),
      headers: {
        HttpHeaders.authorizationHeader:
        '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',
      },
    );

    if (response.statusCode == 200) {
      return UserResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load search result!');
    }
  }

  Future<IssueResponse> searchIssue(String query) async {
    final response = await http.get(
      Uri.parse(
        UrlApi.issues + query,
      ),
      headers: {
        HttpHeaders.authorizationHeader:
        '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',
      },
    );

    if (response.statusCode == 200) {
      return IssueResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load search result!');
    }
  }

  Future<RepoResponse> searchRepo(String query) async {
    final response = await http.get(
      Uri.parse(
        UrlApi.repository + query,
      ),
      headers: {
        HttpHeaders.authorizationHeader:
        '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',
      },
    );

    if (response.statusCode == 200) {
      return RepoResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load search result!');
    }
  }
}

class GithubCache {
  final _cacheUser = <String, UserResponse>{};
  final _cacheIssue = <String, IssueResponse>{};
  final _cacheRepo = <String, RepoResponse>{};

  UserResponse? getUser(String term) => _cacheUser[term];
  IssueResponse? getIssue(String term) => _cacheIssue[term];
  RepoResponse? getRepo(String term) => _cacheRepo[term];

  void setUser(String term, UserResponse result) => _cacheUser[term] = result;
  void setIssue(String term, IssueResponse result) => _cacheIssue[term] = result;
  void setRepo(String term, RepoResponse result) => _cacheRepo[term] = result;

  bool containsUser(String term) => _cacheUser.containsKey(term);
  bool containsIssue(String term) => _cacheIssue.containsKey(term);
  bool containseRepo(String term) => _cacheRepo.containsKey(term);

  void removeUser(String term) => _cacheUser.remove(term);
  void removeIssue(String term) => _cacheIssue.remove(term);
  void removeRepo(String term) => _cacheRepo.remove(term);
}

class GithubRepository {
  const GithubRepository(this.cache, this.client);

  final GithubCache cache;
  final ApiServices client;

  Future<UserResponse> searchUser(String term) async {
    final cachedResult = cache.getUser(term);
    if (cachedResult != null) {
      return cachedResult;
    }
    final result = await client.searchUser(term);
    cache.setUser(term, result);
    return result;
  }

  Future<IssueResponse> searchIssue(String term) async {
    final cachedResult = cache.getIssue(term);
    if (cachedResult != null) {
      return cachedResult;
    }
    final result = await client.searchIssue(term);
    cache.setIssue(term, result);
    return result;
  }

  Future<RepoResponse> searchRepo(String term) async {
    final cachedResult = cache.getRepo(term);
    if (cachedResult != null) {
      return cachedResult;
    }
    final result = await client.searchRepo(term);
    cache.setRepo(term, result);
    return result;
  }

}
