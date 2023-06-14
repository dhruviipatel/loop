import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/AuthProvider.dart';
import '../../../data/providers/HomeProvider.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context);
    final hp = Provider.of<HomeProvider>(context);
    //get token
    ap.getToken();
    //check login status
    ap.checkLoginStatus(context);
    //call mycata function at initial state to get catalist
    hp.mycata.call();

    var catalist = hp.catalist;
    return Container(
      height: 145,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: catalist.length,
        itemBuilder: (context, index) {
          String cataname = "";
          final name = catalist[index].name;
          if (name.length > 10) {
            cataname = name.substring(0, 10) + "...";
          } else {
            cataname = name;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      catalist[index].image,
                      height: 110.0,
                      width: 80.0,
                      fit: BoxFit.cover,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  cataname,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}



//selected container design

// Padding(
//             padding: const EdgeInsets.only(left: 20, bottom: 15),
//             child: Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.asset(
//                     "assets/images/post1.png",
//                     height: 110.0,
//                     width: 80.0,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Container(
//                   height: 110,
//                   width: 80,
//                   decoration: BoxDecoration(
//                       color: appButtonColor.withOpacity(0.6),
//                       borderRadius: BorderRadius.circular(10)),
//                 )
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 32),
//             child: Text(
//               "all",
//               style: TextStyle(color: Colors.white),
//             ),
//           ),