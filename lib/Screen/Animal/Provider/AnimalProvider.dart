import 'package:flutter/material.dart';

class AnimalProvider extends ChangeNotifier
{
  List Animal = [
    "Lion",
    "Tiger",
    "Crocodile",
    "deer",
    "elephant",
    "horse"
  ];
  int index4=0;
  void ChangeIndex3(newindex)
  {
    index4=newindex;
    notifyListeners();
  }
}