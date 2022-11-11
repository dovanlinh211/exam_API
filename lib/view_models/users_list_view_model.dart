import 'package:github_api_app/models/users.dart';
import 'package:github_api_app/repositories/repo_get.dart';
import 'package:github_api_app/view_models/user_view_model.dart';

class UsersListViewModel {
  RepoGet? repoGet;
  UsersListViewModel({required this.repoGet});

  Future<List<UserViewModel>> fetchAllUsers() async {
    List<Users> list = await repoGet!.getAllUsersList();
    return list.map((user) => UserViewModel(users: user)).toList();
  }
}
