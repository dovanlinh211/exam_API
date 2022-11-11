import 'package:github_api_app/models/user_detail.dart';
import 'package:github_api_app/repositories/repo_get.dart';

class UserDetailViewModel {
  RepoGet? repoGet;
  UserDetailViewModel({required this.repoGet});

  Future<UserDetail> fetchUserDetail(String urlDetail) async {
    UserDetail userDetailViewModel = await repoGet!.getUserDetail(urlDetail);
    return userDetailViewModel;
  }
}
