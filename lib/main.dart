import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledgerdiary/firebase_options.dart';
import 'package:ledgerdiary/simple_block_observer.dart';

import 'app.dart';

Future<void> main() async  {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );
  Bloc.observer =SimpleBlocObserver();
  runApp(const MyApp());
}





