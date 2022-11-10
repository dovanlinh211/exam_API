import 'package:github_api_app/models/user_detail.dart';
import 'package:github_api_app/models/users.dart';

abstract class RepoGet {
  Future<List<Users>> getAllUsersList();
  Future<UserDetail> getUserDetail();
}
