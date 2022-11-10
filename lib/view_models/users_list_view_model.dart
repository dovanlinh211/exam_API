import 'package:github_api_app/models/users.dart';
import 'package:github_api_app/repositories/repo_get.dart';

class UsersListViewModel {
  RepoGet? repoGet;
  UsersListViewModel({required this.repoGet});

  Future<List<Users>> fetchAllUsers() async {
    List<Users> list = await repoGet!.getAllUsersList();
    return list;
  }
}
