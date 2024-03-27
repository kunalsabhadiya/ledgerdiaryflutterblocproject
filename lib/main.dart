import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledgerdiary/simple_block_observer.dart';

import 'app.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(name: "LedgerDiary",options: const FirebaseOptions(
     apiKey: "AIzaSyDQl5b5v6ZwF9j0aZbW7FQkP0rVp6SbIiA",
     appId: "1:113424131905:android:9f5b5b9f5b5b5b9f5b5b9f5",
     messagingSenderId: "113424131905",
     projectId: "ledgerdiary"
 ));
  Bloc.observer =SimpleBlocObserver();
  runApp(const MyApp());
}





