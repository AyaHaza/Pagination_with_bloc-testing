import 'package:hive_flutter/hive_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

 Box? postsHive;
 Connectivity connectivity = Connectivity();
ConnectivityResult? connectivityResult;

setup()async{
  postsHive= await Hive.openBox("posts");
  connectivityResult = await connectivity.checkConnectivity();

}

