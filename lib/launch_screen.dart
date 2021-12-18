
import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds:3),(){
      Navigator.pushReplacementNamed(context, '/login_screen');


    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Container(
          color: Colors.blue,
            child: Center(
              child: Text('Events',style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color:Colors.black,
                fontFamily: 'Pacifico',

              )),
            ),
           )


    );
  }
}
