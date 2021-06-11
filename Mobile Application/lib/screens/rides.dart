import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rides extends StatefulWidget {
  @override
  _RidesState createState() => _RidesState();
}

class _RidesState extends State<Rides> with TickerProviderStateMixin {
  int bottomIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: SafeArea(
    //     child: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           Padding(
    //             padding:
    //                 const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
    //             child: Row(
    //               children: [
    //                 Text(
    //                   'Hi ',
    //                   style: kSubTextStyle,
    //                 ),
    //                 Text(
    //                   'Ajini',
    //                   style: kSubTextStyle,
    //                 ),
    //                 Text(
    //                   '!',
    //                   style: kSubTextStyle,
    //                 ),
    //                 Spacer(),
    //                 Container(
    //                   width: 36,
    //                   height: 36,
    //                   child: Image.asset(
    //                     'assets/icons/menu.png',
    //                     scale: 2,
    //                   ),
    //                   // decoration: BoxDecoration(
    //                   //   border: Border.all(color: kSecondaryColor),
    //                   //   borderRadius: BorderRadius.circular(8),
    //                   // ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
    //             child: Text.rich(
    //               TextSpan(
    //                 children: [
    //                   TextSpan(
    //                     text: "Select Your Ride Now!",
    //                     style: kTitleTextStyle,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.only(left: 15, bottom: 0),
    //             child: TabBar(
    //               controller: _tabController,
    //               isScrollable: true,
    //               labelColor: kSecondaryColor,
    //               unselectedLabelColor: kSecondaryColor.withOpacity(0.5),
    //               indicatorSize: TabBarIndicatorSize.label,
    //               indicatorColor: Colors.transparent,
    //               tabs: [
    //                 Tab(
    //                   text: "Pay As You Go",
    //                 ),
    //                 Tab(
    //                   text: "Pay Per Minute",
    //                 ),
    //               ],
    //             ),
    //           ),
    //           SizedBox(
    //             height: 400,
    //             child: Padding(
    //               padding: const EdgeInsets.only(left: 40, top: 10, right: 0),
    //               child: TabBarView(
    //                 controller: _tabController,
    //                 children: [
    //                   ListView.builder(
    //                     itemCount: 5,
    //                     scrollDirection: Axis.horizontal,
    //                     itemBuilder: (context, index) {
    //                       return ProductCard();
    //                     },
    //                   ),
    //                   ListView.builder(
    //                     itemCount: 5,
    //                     scrollDirection: Axis.horizontal,
    //                     itemBuilder: (context, index) {
    //                       return ProductCard();
    //                     },
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    //   bottomNavigationBar: BottomAppBar(
    //     child: Container(
    //       height: 72.0,
    //       color: Colors.white,
    //       child: GNav(
    //         selectedIndex: bottomIndex,
    //         onTabChange: (idx) {
    //           setState(
    //             () {
    //               bottomIndex = idx;
    //             },
    //           );
    //         },
    //         // tabBorder: Border.all(
    //         //   color: kPrimaryColor,
    //         //   width: 1,
    //         // ),
    //         // tabShadow: [
    //         //   BoxShadow(
    //         //     color: kPrimaryLightColor.withOpacity(0.5),
    //         //     blurRadius: 8,
    //         //   )
    //         // ],
    //         curve: Curves.easeInCirc,
    //         duration: Duration(milliseconds: 250),
    //         gap: 8,
    //         color: kPrimaryColor,
    //         activeColor: kSecondaryColor,
    //         iconSize: 24,
    //         tabBackgroundColor: kSecLightColor.withOpacity(0.9),
    //         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    //         tabs: [
    //           GButton(
    //             icon: Icons.home_outlined,
    //             text: 'Home',
    //           ),
    //           GButton(
    //             icon: Icons.pedal_bike,
    //             text: 'Rides',
    //           ),
    //           GButton(
    //             icon: Icons.qr_code_scanner_outlined,
    //             text: 'Scan',
    //           ),
    //           GButton(
    //             icon: Icons.account_circle_outlined,
    //             text: 'Profile',
    //           ),
    //         ],
    //         //onTabChange: null,
    //       ),
    //     ),
    //   ),
    // );
  }
}
