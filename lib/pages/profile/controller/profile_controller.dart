import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends ChangeNotifier {
List<String>? data = <String>[];
  late final SharedPreferences story;
  ProfileController(){
    getData() ;
  }
  getData() async {
    story = await SharedPreferences.getInstance();
    data = story.getStringList('profileData');
    notifyListeners();
  }
}
