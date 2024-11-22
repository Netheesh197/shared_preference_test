import 'package:flutter/material.dart';
import 'package:shared_preference_test/view/home_screen/home_screen.dart';
import 'package:shared_preference_test/view/register_screen/register_screen.dart';
import 'package:shared_preference_test/view/widgets/custo_textform.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Sign in to Your Account",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  CustomTextFormfield(
                    labelText: "your email adress",
                    controller: controller1,
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  CustomTextFormfield(
                    labelText: 'Your password',
                    icon: Icons.visibility_off,
                    controller: controller2,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.domain_verification_rounded),
                          Text("Remember Me")
                        ],
                      ),
                      Text(
                        "Forgot Password",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () async {
                      final SharedPreferences prefs =await SharedPreferences.getInstance();
                           await prefs.setString('userName', controller1.text);
                           await prefs.setString('Password', controller2.text);
                             
                            final userName = prefs.getString('userName');
                            final Password = prefs.getString('Password');

                            final storedUserName = prefs.getString('username');
                            final StoredPass = prefs.getString('password');

                         if(userName == storedUserName && Password == StoredPass){
                          await prefs.setBool('isLogged', true);

                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                         }else{
                          return null;
                         }

                        
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15)),
                      width: 300,
                      child: Center(
                        child: Text(
                          "Sign in",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an Account?"),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
