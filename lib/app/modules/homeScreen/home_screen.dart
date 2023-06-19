import 'package:flutter/material.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:loop/app/modules/homeScreen/inner_widgets/post.dart';
import 'package:provider/provider.dart';
import '../../data/providers/AuthProvider.dart';
import '../../data/providers/HomeProvider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider()
              ..checkLoginStatus(context)
              ..getToken()),
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider()
            ..mycata()
            ..mypost(context),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
            backgroundColor: appbBgColor,
            body: Consumer2<AuthProvider, HomeProvider>(
              builder: (context, ap, hp, child) {
                final isclicked = hp.click;
                var postlist = hp.postlist;
                var catalist = hp.catalist;

                return Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: InkWell(
                            onTap: () => hp.click(),
                            child: Image.asset(
                              "assets/images/logo.png",
                              height: 43,
                              width: 97,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 28,
                        ),
                        Container(
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
                                      padding: const EdgeInsets.only(
                                          left: 20, bottom: 15),
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
                        ),
                        Expanded(
                            child:
                                MyHomePost(hp, isclicked, postlist, context)),
                      ],
                    ),
                    if (isclicked == true)
                      Container(
                        color: Colors.black.withOpacity(0.8),
                      ),
                  ],
                );
              },
            )),
      ),
    );
  }
}
