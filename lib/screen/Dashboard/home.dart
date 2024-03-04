import 'package:flutter/material.dart';
import 'package:lily/constants/variables.dart';
import 'package:lily/screen/Dashboard/dashboard.dart';
import 'package:lily/screen/Dashboard/profile.dart';
import 'package:lily/screen/Payment/main.dart';
import 'package:lily/screen/subscriptions/main.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.selectedIndex});
  int selectedIndex;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    List<Widget> screens = [
      const DashBoard(),
      const Subscription(),
      const PaymentDashboard(),
      const Profile()
      // const DashboardScreen(),
      // // ClassRoomScreen(),
      // TaskScreen(),
      // const GradesScreen(),
      // // isTeacher ? const StudentsProfileScreen() :
      // const ProfileScreen(),
    ];
    List<Widget> screensIcon = [
      Icon(Icons.dashboard, color: Theme.of(context).colorScheme.onPrimary),
      Icon(Icons.money, color: Theme.of(context).colorScheme.onPrimary),
      Icon(Icons.payment, color: Theme.of(context).colorScheme.onPrimary),
      Icon(Icons.person, color: Theme.of(context).colorScheme.onPrimary)
      // navIcon(context, icon: homeIcon, title: 'Home'),
      // navIcon(context, icon: taskIcon, title: 'Task'),
      // navIcon(context, icon: gradesIcon, title: 'Grades'),
      // navIcon(
      //   context,
      //   iconData: Icons.person_outline_sharp,
      //   title: isTeacher ? 'Students' : 'Profile',
      //   isIcon: true,
      // ),
    ];

    return Scaffold(
      body: IndexedStack(
        index: widget.selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.primary,
          child: SizedBox(
            height: height(context) * 0.08,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: screens.length,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  // .copyWith(left: 2),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.selectedIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      width: 45,
                      duration: const Duration(milliseconds: ROUTE_DURATION),
                      decoration: BoxDecoration(
                        border: widget.selectedIndex == index
                            ? Border(
                                top: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  width: 5.0,
                                ),
                              )
                            : null,
                        gradient: widget.selectedIndex == index
                            ? LinearGradient(
                                colors: [
                                  Theme.of(context)
                                      .colorScheme
                                      .onPrimary
                                      .withOpacity(0.5),
                                  Theme.of(context).colorScheme.primary
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              )
                            : null,
                      ),
                      child: screensIcon[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
