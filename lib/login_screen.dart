

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hackthoneventproject/api/controllers/auth_api_controller.dart';
import 'package:hackthoneventproject/helpers/helpers.dart';
import 'package:hackthoneventproject/widgets/app_text_field.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers{

  late TextEditingController _numberTextController;
  late TextEditingController _passwordTextController;
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _numberTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer();
    _tapGestureRecognizer.onTap = onTap;
  }

  void onTap() {
    Navigator.pushNamed(context, '/register_screen');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _numberTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          extendBodyBehindAppBar: true,


          // backgroundColor: Colors.pink.shade300,

        // floatingActionButton: FloatingActionButton(
        //   child:const Icon(Icons.language),
        //   onPressed: (){
        //     Provider.of<LanguageProvider>(context,listen: false).changeLanguage();
        //   },
//
        // ),
//
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: [
            const SizedBox(height: 100,),
            //Text(AppLocalizations.of(context)!.welcome, style:

            const Text('ucas Events', style:

            TextStyle(
              color: Colors.blue,
              fontSize: 50,
              fontFamily: 'Pacifico',
            ),textAlign: TextAlign.center,),
            const SizedBox(height: 20),

            const Text('Welcome to Back', style:
            TextStyle(
              fontSize: 20,
            ),),
            const SizedBox(height: 20),

            // Text(AppLocalizations.of(context)!.start,
            const Text('Login With',

                style:
                TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold

                )),
            const SizedBox(height: 12),
            Text(' Phone'),
            AppTextField(
              controller: _numberTextController,
              //prefixIcon: Icons.person,
              //  hint: AppLocalizations.of(context)!.fullName,
              hint: 'Enter your phone',
              type: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            Text(' Password'),

            AppTextField(
              controller: _passwordTextController,
             // prefixIcon: Icons.lock,
              //  hint: AppLocalizations.of(context)!.password,
              hint: '******',
              obsecure: true,
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: ()async=> await performLogin(),
              //  child:  Text(AppLocalizations.of(context)!.login),
              child:  const Text('Sign in'),


              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary:  Colors.blue,
                minimumSize: const Size(0, 50),
                shape: RoundedRectangleBorder(

                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15,),
           ]
        )
    );
  }


 Future<void> performLogin() async {
   if (checkData()) {
     await login();
   }
 }

bool checkData() {
  if (_numberTextController.text.isNotEmpty &&
      _passwordTextController.text.isNotEmpty) {
print("true");
    return true;
  }
  print("false");
  showSnackBar(context: context,
    message: 'Enter required data',
    error: true,
  );
  return false;
}

Future<void> login() async{
  bool status = await AuthApiController().login(
    context,
    mobile: _numberTextController.text,
    password: _passwordTextController.text,
  );
  print(status);
  if (status){
    Navigator.pushReplacementNamed(context, '/category_screen');
  }
}



}