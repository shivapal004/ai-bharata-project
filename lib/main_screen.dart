import 'package:ai_bharata_project/helper/global.dart';
import 'package:ai_bharata_project/pages/coin_page.dart';
import 'package:ai_bharata_project/pages/home_page.dart';
import 'package:ai_bharata_project/pages/profile_page.dart';
import 'package:ai_bharata_project/pages/wallet_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selectedIndex = 0;
  static final List<Widget> _pages = <Widget> [
    const HomePage(),
    const CoinPage(),
    const SizedBox.shrink(),
    const WalletPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(

      body:
      _pages[_selectedIndex],

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            buildIconWithLabel(Icons.home_outlined, "Home", 0),
            buildIconWithLabel(Icons.monetization_on_outlined, "Coins", 1),
            CircleAvatar(
              backgroundColor: blueColor,
              radius: 30,
              child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.add),
                color: Colors.white,
              ),

            ),
            buildIconWithLabel(Icons.account_balance_wallet_outlined, "Wallet", 3),
            buildIconWithLabel(Icons.person_outline, "You", 4),
          ],
        ),
      ),

    );
  }

  Widget buildIconWithLabel(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 24,
              color: _selectedIndex == index ? Colors.blue : Colors.grey,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: _selectedIndex == index ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

