import 'package:form_field_validator/form_field_validator.dart';
import 'package:nichrome/screens/navigation.dart';
import 'package:flutter/material.dart';

import 'package:nichrome/common/utils.dart';

import 'AuthMethods.dart';
import 'Register.dart';

class LoginScreen extends StatefulWidget {
  static const String Logintitle = "Welcome Back!!";
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  String? email;
  String? password;
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppBar(
                    backgroundColor: Colors.white.withOpacity(0.0),
                    elevation: 0.0,
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.black87,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => SignupScreeen()));
                      },
                    ),
                  ),
                  Image.network(
                    'https://t4.ftcdn.net/jpg/04/28/75/97/360_F_428759715_jsOPITlaytE3QXc2yI1D4U6uwZdVGkRp.jpg',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    LoginScreen.Logintitle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Please login to continue..',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        label: Text(
                          'E-mail',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: (OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.lightBlueAccent, width: 2)))),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Required"),
                      EmailValidator(errorText: "Invalid")
                    ]),
                    onChanged: (val){
                      email = val;
                    }
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                        label: Text(
                          'Password',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        prefixIcon: Icon(
                          Icons.fingerprint,
                        ),
                        // suffixIcon: IconButton(
                        //   onPressed: () {},
                        //   icon: Icon(
                        //     Icons.remove_red_eye_sharp,
                        //   ),
                        // ),
                        border: OutlineInputBorder(),
                        focusedBorder: (OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.lightBlueAccent, width: 2)))),
                    validator: MultiValidator([
                      MinLengthValidator(6, errorText: "min. 8 letters"),
                      MaxLengthValidator(12, errorText: "Max 12 letters")
                    ]),
                    onChanged: (val) {
                      password = val;
                    }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Align(
                  //     alignment: Alignment.centerRight,
                  //     child: TextButton(
                  //         onPressed: (){},
                  //         child: Text(
                  //           'Forgot Password?',
                  //           style: TextStyle(color: Colors.lightBlueAccent),
                  //         ))),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {login();},
                      child: Text(
                        'Login'.toUpperCase(),
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => SignupScreeen()));
                      },
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "Don't have an account?? ",),
                        TextSpan(
                            text: 'Register',
                            style: TextStyle(color: Colors.lightBlueAccent)),
                      ]))),
                ],
              ),
            ),
          ),
        ));
  }
  login()async{
    if(_form.currentState!.validate()){
      String ref = await AuthMethods().LoginWithEmailAndPassword(email!, password!);
      if (ref == "success"){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNavigation()));
      }
      else{
        Snapshot(ref,context);
      }
    }
  }
}
