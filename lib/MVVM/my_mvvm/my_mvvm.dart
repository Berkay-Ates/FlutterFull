import 'package:flutter/material.dart';
import './my_mvvm_view.dart';

class myMvvm extends StatefulWidget {
  @override
  myMvvmView createState() => new myMvvmView();
}



//? Statefull olarak myMvvm var ve myMvvm oluşturuldugunda myMvvmView döndürüyor. 
//? Mymmvview da myMvvmViewModel dan türüyor 
//? myMvvmViewModel da aslında abstract bir class ve myMvvm'e exstends ediyor yani myMVVM2den türüyor. 

  
