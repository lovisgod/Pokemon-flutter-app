import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pokemon/data/Pokemon_repository.dart';
import 'package:pokemon/ui/screens/main_screen.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  _setupLogging();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PokemonRepository>(
          lazy: false,
          create: (_) => PokemonRepository(),
        ),
      ],
      child: MaterialApp(
        title: 'Pokemon App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MainScreen(),
      ),
    );
  }
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

