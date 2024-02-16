import 'package:flutter/material.dart';

/*https://github.com/RanaSharjeelShji/Provider-Tutorial-Code-Red-Clan/blob/main/lib/main.dart*/

class MyModel extends ChangeNotifier
{
  int _counter = 0;

  int get counter => _counter;

  incrementVal()
  {
     _counter++;

     notifyListeners();

  }
}
