import 'package:awwao/classes/user_persistence.dart';
import 'package:awwao/screen/categories_screen.dart';
import 'package:awwao/screen/home_screen.dart';
import 'package:awwao/screen/store_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  String _userEmail = '';
  bool _isLoggedIn = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Load user data from shared preferences
  Future<void> _loadUserData() async {
    final isLoggedIn = await UserPersistence.isLoggedIn();
    final email = await UserPersistence.getUserEmail();

    if (mounted) {
      setState(() {
        _isLoggedIn = isLoggedIn;
        if (email != null) _userEmail = email;
      });
    }
  }

  // Handle logout
  Future<void> _logout() async {
    // Sign out from Firebase
    await FirebaseAuth.instance.signOut();

    // Clear stored user data
    await UserPersistence.clearUserData();

    if (mounted) {
      setState(() {
        _isLoggedIn = false;
      });

      // Navigate to login screen
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  // Define your bottom tab screens
  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const StoreScreen(),
  ];

  // Bottom tab labels & icons
  final List<BottomNavigationBarItem> _bottomItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'হোম'),
    BottomNavigationBarItem(icon: Icon(Icons.category), label: 'বিভাগ'),
    BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'সংরক্ষিত'),
  ];

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Developer",
              style: const TextStyle(fontSize: 18),
            ),
            accountEmail: Text(
              _userEmail,
              style: const TextStyle(fontSize: 14),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(color: Colors.green),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                ),
                const Divider(),
              ],
            ),
          ),
          const Divider(),
          // Show logout only if logged in
          if (_isLoggedIn)
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('লগআউট'),
                onTap: () {
                  Navigator.pop(context);
                  _logout();
                },
              ),
            ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Version 1.0',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ইশকুল',
          style: TextStyle(
            fontFamily: 'Hind Siliguri',
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 35,
            ),
            onPressed: () {
              // If not logged in, navigate to login
              if (!_isLoggedIn) {
                Navigator.pushNamed(context, '/login');
              }
            },
          ),
        ],
      ),

      drawer: _buildDrawer(),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _bottomItems,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
