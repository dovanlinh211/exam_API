import 'package:flutter/material.dart';
import 'package:github_api_app/constants/app_color.dart';
import 'package:github_api_app/constants/size_unit.dart';
import 'package:github_api_app/utils/badge_convert.dart';
import 'package:github_api_app/network/network_request.dart';

class UserDetailScreen extends StatelessWidget {
  final String? url;
  const UserDetailScreen({Key? key, required this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "This is user detail",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: NetworkRequest.fetchUserDetail(url!),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        // Avatar image container
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, SizeUnit.heightSizeUnit * 10, 0, 0),
                          child: Container(
                            width: SizeUnit.widthSizeUnit * 50,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              '${snapshot.data.avatarUrl}',
                            ),
                          ),
                        ),
                        // Row name
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 10, 0, 10),
                          child: Text(
                            '${snapshot.data.name}',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        // Row bio
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, 0, 0, SizeUnit.heightSizeUnit * 2),
                          child: Text(
                            '${snapshot.data.bio}',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        // Divider
                        Divider(
                          height: 3,
                          thickness: 2,
                          indent: SizeUnit.widthSizeUnit * 5,
                          endIndent: SizeUnit.widthSizeUnit * 5,
                        ),
                        // Row person info
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              SizeUnit.widthSizeUnit * 10,
                              SizeUnit.widthSizeUnit * 5,
                              0,
                              SizeUnit.widthSizeUnit * 9),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 0, SizeUnit.widthSizeUnit * 10, 0),
                                child: Icon(
                                  Icons.person,
                                  color: AppColors.iconBlackColor,
                                  size: SizeUnit.heightSizeUnit * 5,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Text(
                                      '${snapshot.data.login}',
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: SizeUnit.widthSizeUnit * 20,
                                    height: SizeUnit.heightSizeUnit * 4,
                                    decoration: BoxDecoration(
                                      color: AppColors.badgeColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${Badge.badgeSiteAdmin(snapshot.data.siteAdmin)}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Row address
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              SizeUnit.widthSizeUnit * 10, 0, 0, 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                                child: Icon(
                                  Icons.location_on,
                                  color: AppColors.iconBlackColor,
                                  size: SizeUnit.heightSizeUnit * 5,
                                ),
                              ),
                              Text(
                                '${snapshot.data.location}',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Row blog
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              SizeUnit.widthSizeUnit * 10, 10, 0, 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                                child: Icon(
                                  Icons.link_rounded,
                                  color: AppColors.iconBlackColor,
                                  size: SizeUnit.heightSizeUnit * 5,
                                ),
                              ),
                              Text(
                                '${snapshot.data.blog}',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  color: AppColors.badgeColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  // if has error while loading data
                  else if (snapshot.hasError) {
                    return Center(
                      child: Text("Has Error ${url} "),
                    );
                  }
                  //  show loading icon when fetch data
                  else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
