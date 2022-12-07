import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/choose_location.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',

  routes: {
    '/': (context) => const Loading(),
    '/home': (context) => Home(),
    '/location': (context) => const ChooseLocation(),
  },
));

