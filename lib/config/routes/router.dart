import 'package:flutter/material.dart';
import 'package:mobile/features/idea/domain/entities/idea.dart';
import 'package:mobile/features/idea/presentation/pages/add_idea.dart';
import 'package:mobile/features/idea/presentation/pages/edit.dart';
import 'package:mobile/features/idea/presentation/pages/home.dart';
import 'package:mobile/features/idea/presentation/pages/menu.dart';
import 'package:mobile/features/idea/presentation/pages/on_boarding.dart';
import 'package:mobile/main.dart';

class AppRoutes {

  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return _materialRoute(const OnBoarding());
      case '/home' :
        return _materialRoute(const MyHomePage());
      case '/idea' :
        return _materialRoute(const MenuPage(index: 0));
      case '/lean_canvas' :
        return _materialRoute(const MenuPage(index: 1));
      case '/add_idea' :
        return _materialRoute(const AddIdeaPage());
      case '/edit_idea' :
        return _materialRoute(EditIdeaPage(idea: settings.arguments as Idea));
      default :
        return _materialRoute(const MyApp());
    }
  }

  static Route<dynamic> _materialRoute (Widget widget) {
    return MaterialPageRoute(builder: (_) => widget);
  }
}