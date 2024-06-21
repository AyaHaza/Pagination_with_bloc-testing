import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/PostAdpter/postTypeAdapter.dart';
import 'core/config/bloc_observe.dart';
import 'core/config/hive_config.dart';
import 'feature/posts/view/postPage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PostTypeAdapter());
  await setup();
  Bloc.observer = MyBlocObserver();
  runApp( const MyApp());
}
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
