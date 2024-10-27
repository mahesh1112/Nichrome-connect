import 'package:firebase_auth/firebase_auth.dart';
import 'package:nichrome/screens/navigation.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nichrome/common/utils.dart';
import 'AuthMethods.dart';
import 'LoginScreen.dart';

class SignupScreeen extends StatefulWidget {
  const SignupScreeen({Key? key}) : super(key: key);

  @override
  State<SignupScreeen> createState() => _SignupScreeenState();
}

class _SignupScreeenState extends State<SignupScreeen> {
  @override
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  String name= "";
  String email= "";
  String password= "";
  String role = "";
  String phone = "";

  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                /*gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      //colors: [Color(0xFF7986CB),Colors.deepPurple]
                    colors:
                  )*/),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://media.istockphoto.com/id/1281150061/vector/register-account-submit-access-login-password-username-internet-online-website-concept.jpg?s=612x612&w=0&k=20&c=9HWSuA9IaU4o-CK6fALBS5eaO1ubnsM08EOYwgbwGBo=',
                    scale: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    'Create an account',
                    style: TextStyle(
                      fontSize: 30,
                      // fontWeight: FontWeight.bold,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text(
                        'Full Name',
                        style:
                        TextStyle(fontSize: 15),
                      ),
                      prefixIcon: Icon(Icons.person_outline_rounded),
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.lightBlueAccent),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0, color: Colors.lightBlueAccent)),
                    ),
                    validator: RequiredValidator(errorText: "This field is required"),
                    onChanged: (val){
                      name = val;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text(
                        'Email',
                        style:
                        TextStyle(fontSize: 15),
                      ),
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.lightBlueAccent),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0, color: Colors.lightBlueAccent)),
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "This field is required"),
                      EmailValidator(errorText: "Invalid")
                    ]),
                    onChanged: (val){
                      email = val;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text(
                        'Role',
                        style: TextStyle(fontSize: 15),
                      ),
                      prefixIcon: Icon(Icons.verified_user_outlined),
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.lightBlueAccent),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0, color: Colors.lightBlueAccent)),
                    ),
                    onChanged: (val){
                      role = val;
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text(
                        'Phone No.',
                        style: TextStyle(fontSize: 15),
                      ),
                      prefixIcon: Icon(Icons.call),
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.lightBlueAccent),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0, color: Colors.lightBlueAccent)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a mobile number";
                      } else if (value.length != 10) {
                        return "Mobile number must be exactly 10 digits";
                      }
                      return null;
                    },
                    onChanged: (val){
                      phone = val;
                    },
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
                        style:
                        TextStyle(fontSize: 15,),
                      ),
                      prefixIcon: Icon(Icons.password_outlined),
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.lightBlueAccent),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0, color: Colors.lightBlueAccent)),
                    ),
                    validator: MultiValidator([
                      MinLengthValidator(8, errorText: "min. 8 letters"),
                      MaxLengthValidator(12, errorText: "to longg..")
                    ]),
                    onChanged: (val){
                      password = val;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {register();},
                          child: Text('SignUp'.toUpperCase()))),
                  SizedBox(
                    height: 10,
                  ),
                  Text(('OR')),
                  // SizedBox(
                  //     width: double.infinity,
                  //     child: OutlinedButton.icon(
                  //         onPressed: () {},
                  //         icon: Icon(Icons.ads_click_outlined,
                  //             color: Colors.deepOrangeAccent),
                  //         label: Text(
                  //           'Sign in with Google'.toUpperCase(),
                  //           style: TextStyle(color: Colors.deepOrangeAccent),
                  //         ))),
                  TextButton(
                      onPressed: () async {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'Already have an Account? '),
                        TextSpan(
                            text: 'Login',
                            style: TextStyle(color: Colors.deepOrangeAccent)),
                      ])))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  register()async{
    if(_form.currentState!.validate()){
      String ref = await AuthMethods().RegisterWithEmailAndPassword(name, email, password,role, phone);
      if(ref == "success"){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavigation()));
      }
      else{
        Snapshot(ref, context);
      }

    }
  }
}
