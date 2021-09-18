import 'package:celta/pages/auth_page.dart';
import 'package:celta/pages/fac_page.dart';
import 'package:celta/pages/home_page.dart';
import 'package:celta/pages/suministros_page.dart';
import 'package:celta/services/firebase/auth_app_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase
      .initializeApp(); //espero a que inicialice Firebase antes de continuar con runApp
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthAppState(),
      builder: (context, _) => App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Rutas
      initialRoute: 'homepage',
      routes: {
        'authpage': (BuildContext context) => AuthPage(),
        'facpage': (BuildContext context) => FacPage(),
        'homepage': (BuildContext context) => HomePage(),
        'suministrosPage': (BuildContext context) => SuministrosPage(),
      },
    );
  }
}
