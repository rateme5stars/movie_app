import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/support/nav_bottom_bar.dart';
import 'package:movie_app/bloc/home_cubit.dart';
import 'package:movie_app/networking/remote_repository.dart';
import 'package:movie_app/screen/coming_soon.dart';
import 'package:movie_app/screen/download.dart';
import 'package:movie_app/screen/home.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);
  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int activeTabIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTabIdx,
      children: [
        Home(cubit: HomeCubit(RemoteRepositoryImpl(Client()))),
        const ComingSoon(),
        const Download(),
      ],
    );
  }

  Widget getFooter() {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            items.length,
            (idx) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    activeTabIdx = idx;
                  });
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: [
                      Icon(
                        items[idx]['icon'],
                        color: activeTabIdx == idx ? Colors.white : Colors.grey,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        items[idx]['text'],
                        style: TextStyle(
                          color:
                              activeTabIdx == idx ? Colors.white : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
