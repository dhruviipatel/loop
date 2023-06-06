import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:loop/app/modules/authenticationScreens/Editprofile_screen.dart';
import 'package:loop/app/modules/userprofileScreen/following_follower_scrren.dart';
import 'package:loop/app/modules/userprofileScreen/inner_widgets/posts.dart';
import 'package:loop/app/modules/userprofileScreen/inner_widgets/setting.dart';
import 'package:loop/app/modules/userprofileScreen/userprofileProvider.dart';
import 'package:provider/provider.dart';
import '../../data/providers/AuthProvider.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final up = Provider.of<UserProfileProvider>(context);
    final clickvalue = up.buttonclicked;

    final ap = Provider.of<AuthProvider>(context);

    ap.getUserData.call();
    print(ap.user.profileImage);

    return Scaffold(
        backgroundColor: appbBgColor,
        body: clickvalue == true
            ? Stack(
                children: [
                  UserProfile(context),
                  Container(
                    color: Colors.black.withOpacity(0.8),
                  )
                ],
              )
            : Stack(
                children: [UserProfile(context), Container()],
              ));
  }
}

Widget UserProfile(context) {
  final up = Provider.of<UserProfileProvider>(context);
  final clickvalue = up.buttonclicked;

  final ap = Provider.of<AuthProvider>(context);
  ap.getUserData.call();

  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Profile",
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            Row(
              children: [
                InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        )),
                    child:
                        Icon(IconlyLight.edit, size: 27, color: Colors.white)),
                SizedBox(width: 18),
                Setting(context, isbtnclicked: clickvalue),
              ],
            )
          ],
        ),
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: appButtonColor),
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 234, 226, 226),
              image: DecorationImage(
                image: NetworkImage(ap.user.profileImage),

                //image: AssetImage("assets/images/profile.png"),
              ),
            ),
          ),
        ),
      ),
      Text(
        ap.user.name,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
      ),
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "+4590",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                SizedBox(height: 7),
                Text(
                  "Posts",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: appHintTextColor),
                )
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FollowingFollowerScreen(),
                ));
              },
              child: Column(
                children: [
                  Text(
                    "5145",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(height: 7),
                  Text(
                    "Following",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: appHintTextColor),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FollowingFollowerScreen(),
                ));
              },
              child: Column(
                children: [
                  Text(
                    "6897",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(height: 7),
                  Text(
                    "Followers",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: appHintTextColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      Expanded(
        child: PostWidget(),
      ),
    ],
  );
}
