import 'package:awwao/screens/categories_screen.dart';
import 'package:awwao/screens/home_screen.dart';
import 'package:awwao/screens/login_screen.dart';
import 'package:awwao/screens/register_screen.dart';
import 'package:awwao/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'পাখি ও প্রাণী',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Hind Siliguri',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MainPage(),
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  // Define your bottom tab screens
  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const SavedScreen(),
    const SettingsScreen(),
  ];

  // Bottom tab labels & icons
  final List<BottomNavigationBarItem> _bottomItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'হোম'),
    BottomNavigationBarItem(icon: Icon(Icons.category), label: 'বিভাগ'),
    BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'সংরক্ষিত'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'সেটিংস'),
  ];

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'আপনার নাম',
              style: TextStyle(fontSize: 18),
            ),
            accountEmail: const Text(
              'email@example.com',
              style: TextStyle(fontSize: 14),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile.png', // তোমার প্রোফাইল ছবি এখানে
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
                ListTile(
                  leading: const Icon(Icons.category),
                  title: const Text('বিভাগ'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CategoriesScreen(),
                      ),
                    );

                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.bookmark),
                  title: const Text('সংরক্ষিত'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CategoriesScreen(),
                      ),
                    );
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.login),
                  title: const Text('লগইন'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/login');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.app_registration),
                  title: const Text('রেজিস্ট্রেশন'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/register');
                  },
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('লগআউট'),
              onTap: () {
                Navigator.pop(context);
                // Logout Logic
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
          'পাখি ও প্রাণী',
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
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

// Dummy Screens for Demo Purpose

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('এটা হলো সংরক্ষিত স্ক্রীন'));
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('এটা হলো সেটিংস  স্ক্রীন'));
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('প্রোফাইল')),
      body: const Center(child: Text('এটা হলো প্রোফাইল স্ক্রীন')),
    );
  }
}
