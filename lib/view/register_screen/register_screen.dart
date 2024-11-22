import 'package:flutter/material.dart';
import 'package:shared_preference_test/view/login_screen/login_screen.dart';
import 'package:shared_preference_test/view/widgets/custo_textform.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
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
                    "Sign Up For Free",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CustomTextFormfield(
                    labelText: "your Email Adress",
                    controller: c1,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextFormfield(
                    labelText: "your passwword",
                    icon: Icons.visibility_off,
                    controller: c2,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextFormfield(
                    labelText: "your confirm password",
                    icon: Icons.visibility_off,
                    controller: c3,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () async{
                      final SharedPreferences prefs =await SharedPreferences.getInstance();

                     if(c2.text == c3.text){
                     prefs.setString("username", c1.text);
                     prefs.setString("password", c2.text);
                     prefs.setString("cnfirmpass", c3.text);
                     Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),));
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
                          "Sign Up",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                    },
                    child: Text(
                      "Sign up",
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
