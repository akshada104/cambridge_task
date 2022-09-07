import 'package:cambridge_task/home_view.dart';
import 'package:flutter/material.dart';

import 'responsive_screen.dart';

class MainView extends StatefulWidget {
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: Responsive.isMobile(context)
            ? Container(
                color: Colors.white,
                child: Container(
                  // height: Dimens.seventy + Dimens.three,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        spreadRadius: 0,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: BottomNavigationBar(
                      selectedLabelStyle: const TextStyle(fontSize: 12),
                      unselectedLabelStyle: const TextStyle(fontSize: 10),
                      onTap: onItemTapped,
                      currentIndex: selectedIndex,
                      showSelectedLabels: true,
                      showUnselectedLabels: true,
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: Colors.black26,
                      unselectedItemColor: Colors.white,
                      selectedItemColor: Colors.orange,
                      elevation: 0,
                       items: [
                        const BottomNavigationBarItem(
                          icon: Icon(
                            Icons.home,
                          ),
                          label: 'Home',
                        ),
                        const BottomNavigationBarItem(
                          icon: Icon(
                            Icons.settings,
                          ),
                          label: 'Settings',
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : HomeView(),
        body: SafeArea(
            child: Responsive.isMobile(context)
                ? SizedBox(
                    child: IndexedStack(
                      key: const Key('index-stack'),
                      index: selectedIndex,
                      children: [
                        HomeView(),
                        HomeView(),
                      ],
                    ),
                  )
                : Container()),
      );
}
