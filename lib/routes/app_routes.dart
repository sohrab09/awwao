import 'package:awwao/screens/animals_screen.dart';
import 'package:awwao/screens/arabic_screen.dart';
import 'package:awwao/screens/bangla_screen.dart';
import 'package:awwao/screens/birds_screen.dart';
import 'package:awwao/screens/english_screen.dart';
import 'package:awwao/screens/fishes_screen.dart';
import 'package:awwao/screens/flowers_screen.dart';
import 'package:awwao/screens/fruits_screen.dart';
import 'package:awwao/screens/math_screen.dart';
import 'package:awwao/screens/trees_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const birds = '/birds';
  static const animals = '/animals';
  static const fish = '/fish';
  static const trees = '/trees';
  static const flowers = '/flowers';
  static const fruits = '/fruits';
  static const bangla = '/bangla';
  static const english = '/english';
  static const math = '/math';
  static const arabic = '/arabic';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case birds:
        return MaterialPageRoute(builder: (_) => BirdsScreen());
      case animals:
        return MaterialPageRoute(builder: (_) => AnimalsScreen());
      case fish:
        return MaterialPageRoute(builder: (_) => FishesScreen());
      case trees:
        return MaterialPageRoute(builder: (_) => TreesScreen());
      case flowers:
        return MaterialPageRoute(builder: (_) => FlowersScreen());
      case fruits:
        return MaterialPageRoute(builder: (_) => FruitsScreen());
      case bangla:
        return MaterialPageRoute(builder: (_) => BanglaScreen());
      case english:
        return MaterialPageRoute(builder: (_) => EnglishScreen());
      case math:
        return MaterialPageRoute(builder: (_) => MathScreen());
      case arabic:
        return MaterialPageRoute(builder: (_) => ArabicScreen());
      // handle all other cases...
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(child: Text('Page not found: ${settings.name}')),
              ),
        );
    }
  }
}
