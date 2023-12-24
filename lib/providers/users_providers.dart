import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:msib_suitmedia/models/users_model.dart';
import 'package:riverpod/riverpod.dart';

class UserProvider {
  static const String _baseUrl = "https://reqres.in";
  int _currentPage = 1;
  Future<List<User>> fetchNextPage() async {
    _currentPage++; // Increment the page number
    return fetchData(page: _currentPage, perPage: 10);
  }

  Future<List<User>> fetchData(
      {required int page, required int perPage}) async {
    final Uri url =
        Uri.parse("$_baseUrl/api/users?page=$page&per_page=$perPage");
    try {
      final response = await http.get(url);
      if (response.statusCode != 200) return [];

      final Map<String, dynamic> fetchedData = json.decode(response.body);
      return (fetchedData['data'] as List)
          .map((userMap) => User.fromMap(userMap))
          .toList();
    } catch (error) {
      rethrow;
    }
  }
}

final userServiceProvider = Provider<UserProvider>((ref) => UserProvider());

final usersProvider = FutureProvider.autoDispose<List<User>>((ref) async {
  final userService = ref.read(userServiceProvider);
  return userService.fetchData(
      page: 1, perPage: 10); // Example values for page and perPage
});
