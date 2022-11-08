import 'package:flutter/material.dart';
import 'package:proform1/src/fragments/category_fragment.dart';
import 'package:proform1/src/fragments/home_fragment.dart';
import 'package:proform1/src/fragments/profile_fragment.dart';
import 'package:proform1/src/fragments/subscription_fragment.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> fragments = [
      HomeFragment(),
      CategoryFragment(),
      SubscriptionFragment(),
      ProfileFragment()
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Profile Page"),
      ),
      body: fragments[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: "Subscription"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
