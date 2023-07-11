import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/themes/themes.dart';
import '../../../data/providers/UserProfileProvider.dart';

Widget Following(followinglist) {
  return ListView.builder(
    itemCount: followinglist.length,
    itemBuilder: (context, index) {
      String email = followinglist[index].followingCustomer.email;
      var splitemail = email.split("@");
      var uid = splitemail[0];

      var profile = followinglist[index].followingCustomer.profileImage;

      var name = followinglist[index].followingCustomer.name;

      String resulteduid = "";

      if (uid.length > 15) {
        resulteduid = uid.substring(0, 15) + "...";
      } else {
        resulteduid = uid;
      }

      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        //color: const Color(0xff7c94b6),
                        image: DecorationImage(
                          image: NetworkImage(
                            profile,
                          ),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(color: appButtonColor),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          resulteduid,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        if (followinglist[index].followingCustomer.name == null)
                          Text(
                            "Unknown",
                            style: TextStyle(
                                fontSize: 12, color: appHintTextColor),
                          )
                        else
                          Text(
                            followinglist[index].followingCustomer.name,
                            style: TextStyle(
                                fontSize: 12, color: appHintTextColor),
                          )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () => {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: appbBgColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(50))),
                          context: context,
                          builder: (context) => DraggableScrollableSheet(
                            expand: false,
                            initialChildSize: 0.45,
                            minChildSize: 0.3,
                            maxChildSize: 0.8,
                            builder: (context, scrollController) =>
                                SingleChildScrollView(
                              child: UnFollowSheet(
                                  context, profile, name, followinglist[index]),
                            ),
                          ),
                        ),
                      },
                      child: Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                            border: Border.all(color: appButtonColor),
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            "Unfollow",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.more_vert, color: appHintTextColor)
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.white,
          ),
        ],
      );
    },
  );
}

Widget Followers(followerlist, followinglist) {
  return ListView.builder(
    itemCount: followerlist.length,
    itemBuilder: (context, index) {
      final up = Provider.of<UserProfileProvider>(context);

      String email = followerlist[index].followedCustomer.email;
      var splitemail = email.split("@");
      var uid = splitemail[0];

      var profile = followerlist[index].followedCustomer.profileImage;

      var name = followerlist[index].followedCustomer.name;

      var followinguserid = followerlist[index].customerId;

      var userid = followerlist[index].followingCustomerId;

      String resulteduid = "";

      if (uid.length > 15) {
        resulteduid = uid.substring(0, 15) + "...";
      } else {
        resulteduid = uid;
      }

      //check user following his follower or not
      bool isfollowing = false;
      var mycustid = followerlist[index].customerId;
      for (var following in followinglist) {
        if (mycustid == following.followingCustomerId) {
          isfollowing = true;
        }
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              profile,
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          border: Border.all(color: appButtonColor)),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          resulteduid,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Text(
                          name,
                          style:
                              TextStyle(fontSize: 12, color: appHintTextColor),
                        ),
                      ],
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: appbBgColor,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(50))),
                      context: context,
                      builder: (context) => DraggableScrollableSheet(
                        expand: false,
                        initialChildSize: 0.45,
                        minChildSize: 0.3,
                        maxChildSize: 0.8,
                        builder: (context, scrollController) =>
                            SingleChildScrollView(
                          child: RemoveFollowerSheet(
                              context, profile, name, followerlist[index]),
                        ),
                      ),
                    ),
                  },
                  child: Container(
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                        border: Border.all(color: appButtonColor),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        "Remove",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 65, bottom: 15, top: 5),
              child: isfollowing == true
                  ? Text(
                      "Following",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    )
                  : InkWell(
                      onTap: () => up.followUser(
                        followinguserid,
                        userid,
                        context,
                      ),
                      child: Text(
                        "Follow",
                        style: TextStyle(fontSize: 12, color: appButtonColor),
                      ),
                    )),
          Divider(
            thickness: 1,
            color: Colors.white,
          ),
        ],
      );
    },
  );
}

Widget RemoveFollowerSheet(context, profile, name, followerlist) {
  final up = Provider.of<UserProfileProvider>(context);
  var followerId = followerlist.customerId;
  var userId = followerlist.followingCustomerId;
  print(followerId);
  print(userId);
  return Padding(
    padding: const EdgeInsets.only(left: 50, right: 50),
    child: Column(
      children: [
        SizedBox(height: 30),
        Container(
          color: appHintTextColor,
          height: 3,
          width: 150,
        ),
        SizedBox(height: 30),
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                profile,
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Remove Follower ?",
          style: TextStyle(
              color: Colors.white, fontSize: 21, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 10),
        Text(
          "Do you really want to remove ${name} from your follower list?",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: appHintTextColor,
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                up.removeFollower(followerId, userId, context);
                up.myfollowing(userId);
              },
              child: Container(
                width: 120,
                height: 35,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: appButtonColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Remove",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 120,
                height: 35,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}

Widget UnFollowSheet(context, profile, name, followinglist) {
  final up = Provider.of<UserProfileProvider>(context);
  var followingId = followinglist.followingCustomerId;
  var userId = followinglist.customerId;
  print(followingId);
  print(userId);

  return Padding(
    padding: const EdgeInsets.only(left: 50, right: 50),
    child: Column(
      children: [
        SizedBox(height: 30),
        Container(
          color: appHintTextColor,
          height: 3,
          width: 150,
        ),
        SizedBox(height: 30),
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                profile,
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
        ),
        SizedBox(height: 20),
        Text(
          name,
          style: TextStyle(
              color: Colors.white, fontSize: 21, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 10),
        Text(
          "Do you really want to unfollow ${name} ?",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: appHintTextColor,
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                up.UnFollowUser(followingId, userId, context);
                Navigator.pop(context);
              },
              child: Container(
                width: 120,
                height: 35,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: appButtonColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Unfollow",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 120,
                height: 35,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}
