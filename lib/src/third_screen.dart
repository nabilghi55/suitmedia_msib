import 'package:flutter/material.dart';
import 'package:msib_suitmedia/models/users_model.dart';
import 'package:msib_suitmedia/providers/users_providers.dart';
import 'package:msib_suitmedia/widget/appbar.dart';
import 'package:msib_suitmedia/widget/loading.dart';
import 'package:msib_suitmedia/widget/user_container.dart';

class ThirdScreen extends StatefulWidget {
  static String route = '/third_screen';

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final UserProvider _userService = UserProvider();
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  bool _isBottomLoading = false;
  bool _bottomLoadingError = false;
  int _pageNumber = 1;
  int _perPageNumber = 10;
  List<User> _userProfiles = [];

  @override
  void initState() {
    super.initState();
    _loadData();
    _scrollController.addListener(_scrollListener);
  }

  Future<void> _loadData() async {
    if (_isLoading || _isBottomLoading) return;

    setState(() => _isLoading = true);

    try {
      final newData = await _userService.fetchData(
          page: _pageNumber, perPage: _perPageNumber);
      setState(() {
        _userProfiles.addAll(newData);
        _pageNumber++;
      });
    } catch (error) {
      // Handle error here
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error loading data')));
    } finally {
      if (context.mounted) setState(() => _isLoading = false);
    }
  }

  void _scrollListener() {
    if (!_isLoading &&
        !_isBottomLoading &&
        !_bottomLoadingError &&
        _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
      _loadBottomData();
    }
  }

  Future<void> _loadBottomData() async {
    if (_isBottomLoading) return;

    setState(() => _isBottomLoading = true);

    try {
      final newData = await _userService.fetchData(
          page: _pageNumber, perPage: _perPageNumber);
      setState(() {
        _userProfiles.addAll(newData);
        _pageNumber++;
      });
    } catch (error) {
      setState(() => _bottomLoadingError = true);
    } finally {
      if (context.mounted) setState(() => _isBottomLoading = false);
    }
  }

  Widget _buildUserContainer(User user) {
    return UserContainer(
      user: user,
      onTap: () =>
          Navigator.of(context).pop("${user.firstName} ${user.lastName}"),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Third Screen"),
      body: RefreshIndicator(
        onRefresh: () async {
          _pageNumber = 1;
          _userProfiles.clear();
          await _loadData();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: _isLoading && _userProfiles.isEmpty
              ? LoadingIndicator()
              : _userProfiles.isEmpty
                  ? Center(child: Text("Sorry, no data available"))
                  : ListView.separated(
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        if (index < _userProfiles.length) {
                          return _buildUserContainer(_userProfiles[index]);
                        } else if (_bottomLoadingError) {
                          return Center(
                            child: TextButton(
                              onPressed: _loadBottomData,
                              child: const Text(
                                  "Error loading more data. Tap to retry."),
                            ),
                          );
                        } else {
                          return LoadingIndicator();
                        }
                      },
                      separatorBuilder: (_, __) =>
                          const Divider(color: Colors.grey),
                      itemCount: _userProfiles.length +
                          (_isBottomLoading ? 1 : 0) +
                          (_bottomLoadingError ? 1 : 0),
                    ),
        ),
      ),
    );
  }
}
