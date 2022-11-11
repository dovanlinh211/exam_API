import 'package:github_api_app/models/users.dart';

class UserViewModel {
  Users? users;

  UserViewModel({required this.users});

  get login => users?.login;
  get avatarUrl => users?.avatarUrl;
  get siteAdmin => users?.siteAdmin;

  get url => users?.url;
}
