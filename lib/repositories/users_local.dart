import 'package:github_api_app/models/users.dart';
import 'package:github_api_app/models/user_detail.dart';
import 'package:github_api_app/repositories/repo_get.dart';

class UsersLocal extends RepoGet {
  @override
  Future<List<Users>> getAllUsersList() {
    // TODO: implement getAllUsersList
    throw UnimplementedError();
  }

  @override
  Future<UserDetail> getUserDetail() {
    // TODO: implement getUserDetail
    throw UnimplementedError();
  }
  
}