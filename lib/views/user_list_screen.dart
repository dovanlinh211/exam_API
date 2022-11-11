import 'package:flutter/material.dart';
import 'package:github_api_app/constants/app_color.dart';
import 'package:github_api_app/constants/size_unit.dart';
import 'package:github_api_app/repositories/users_api.dart';
import 'package:github_api_app/utils/badge_convert.dart';
import 'package:github_api_app/view_models/user_view_model.dart';
import 'package:github_api_app/view_models/users_list_view_model.dart';
import 'package:github_api_app/views/user_detail_screen.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  var usersListViewModel = UsersListViewModel(repoGet: UsersAPI());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Github User List MVVM"),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeUnit().init(constraints, orientation);
              return Column(
                children: [
                  Expanded(
                      child: FutureBuilder<List<UserViewModel>>(
                    future: usersListViewModel.fetchAllUsers(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        var users = snapshot.data;
                        return ListView.builder(
                            padding: EdgeInsets.all(10),
                            itemCount: users?.length,
                            itemBuilder: (context, index) {
                              // Navigate to User Detail when tap on item
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UserDetailScreen(
                                                  url: users![index].url)));
                                  print(
                                      "taped to ${users![index].login} at:\n ${DateTime.now()}");
                                },

                                // ITEM in ListView
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: AppColors.cardColor,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0, 0.05),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(10, 10, 10, 10),
                                          // Row Layout
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              // Avatar contrainer
                                              Container(
                                                width:
                                                    SizeUnit.widthSizeUnit * 27,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  '${users![index].avatarUrl}',
                                                ),
                                              ),

                                              // Infomation Column
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  // Name row
                                                  Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            SizeUnit.widthSizeUnit *
                                                                8,
                                                            0,
                                                            0,
                                                            0),
                                                    child: Text(
                                                      "${users[index].login}",
                                                      style: const TextStyle(
                                                          color: AppColors
                                                              .textLoginColor),
                                                    ),
                                                  ),

                                                  // Badge row
                                                  Padding(
                                                      padding: EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              SizeUnit.widthSizeUnit *
                                                                  8,
                                                              SizeUnit.heightSizeUnit *
                                                                  1,
                                                              0,
                                                              0),
                                                      child: Container(
                                                        width: SizeUnit
                                                                .widthSizeUnit *
                                                            20,
                                                        height: SizeUnit
                                                                .widthSizeUnit *
                                                            6,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AppColors
                                                              .badgeColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(25),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                              '${Badge.badgeSiteAdmin(users[index].siteAdmin)}',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12,
                                                              )),
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // end of Item code
                              );
                            });
                      }
                    },
                  ))
                ],
              );
            },
          );
        }));
  }
}
