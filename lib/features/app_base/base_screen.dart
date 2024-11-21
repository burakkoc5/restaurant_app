// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:restaurant_app/features/home/home_screen.dart';
// import 'package:restaurant_app/features/profile/profile_screen.dart';

// @RoutePage()
// class BaseScreen extends StatelessWidget {
//   const BaseScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AutoTabsRouter.builder(
//       builder: (context, child, animation) {
//         final tabsRouter = AutoTabsRouter.of(context);
//         return Scaffold(
//           body: (tabsRouter.activeIndex == 0) ? HomeScreen() : ProfileScreen(),
//           bottomNavigationBar: BottomNavigationBar(
//             currentIndex: tabsRouter.activeIndex,
//             onTap: tabsRouter.setActiveIndex,
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'BUrak', // No label here
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: '', // No label here
//               ),
//             ],
//             showSelectedLabels: false, // Hide selected label
//             showUnselectedLabels: false, // Hide unselected label
//           ),
//         );
//       },
//     );
//   }
// }
