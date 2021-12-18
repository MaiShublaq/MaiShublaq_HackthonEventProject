
import 'package:flutter/material.dart';
import 'package:hackthoneventproject/category_screen.dart';
import 'package:hackthoneventproject/create_screen.dart';
import 'package:hackthoneventproject/launch_screen.dart';
import 'package:hackthoneventproject/login_screen.dart';
import 'package:hackthoneventproject/category_details.dart';
import 'package:hackthoneventproject/prefs/shared_pref_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await SharedPrefController().initPref();

  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/launch_screen'   ,
        routes: {
          '/login_screen':(context)=> const LoginScreen(),

         //'/activate_screen':(context)=> const ActivateScreen(),
         // '/froget_password_screen':(context)=> const ForgetPasswordScreen(),

          '/launch_screen':(context)=> const LaunchScreen(),
         // '/main_screen':(context)=> const CategoryDetails(),
          '/category_screen':(context)=> const CategoryScreen(),
          //'/create_screen':(context)=> const CreateScreen(),

          //  '/categories_screen':(context)=> const CategoriesScreen(),
          //'/products_screen':(context)=> const HomeProductsScreen(),
          //'/test_screen':(context)=> const Test(),
          // '/sub_categories_screen':(context)=> const SubCategoriesScreen(),














        }
    );
  }
}
