import 'package:datademo/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../services/db_service.dart';
import 'model/user_model.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  doLogin() async{
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var user =  User.from( email: email,password: password);

    HiveDB().storeUser(user);
    var user2 = HiveDB().loadUser();
    print(user2.email);
    print(user2.password);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[800],
      body: Container(
        child: Column(
          children: [
            //#header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/img.png"),
                      )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text("Welcome", style: TextStyle(color: Colors.grey[300], fontSize: 18),),
                  const SizedBox(height: 10,),
                  const Text('Sign In', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),
                  //#body

                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),

                ),
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        const Text("Email", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        const SizedBox(height: 10,),
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: "Email",
                          ),
                        ),
                        const SizedBox(height: 30,),
                        const Text("Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        const SizedBox(height: 10,),
                        TextField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            hintText: "Enter Password",
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Center(child: Text('Forgot password ?', style: TextStyle(color: Colors.grey[400]),)),
                        const SizedBox(height: 30,),
                        GestureDetector(
                          onTap: () {
                            doLogin();
                          },
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.teal[800],

                            ),
                            child: const Center(
                              child: Text("Sign in", style: TextStyle(color: Colors.white,fontSize: 20),),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            SizedBox(width: MediaQuery.of(context).size.width/2 -70,
                              child: const Divider(),),
                            const SizedBox(width: 30,),
                            Text("OR", style: TextStyle(color: Colors.grey[400]),),
                            const SizedBox(width: 30,),
                            SizedBox(width: MediaQuery.of(context).size.width/2 - 70,
                              child: const Divider(),
                            )

                          ],
                        ),
                        const SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: const [
                            Icon(Icons.facebook, color: Colors.blue,),
                            SizedBox(width: 40,),
                            Icon(Icons.telegram, color: Colors.blueAccent,),
                            SizedBox(width: 40,),
                            Icon(LineIcons.instagram, color: Colors.deepOrange),
                          ],
                        ),
                        const SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don`t have an account ?"),
                            const SizedBox(width: 5,),
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(SignUp.id);
                                },
                                child: Text("Sign Up", style: TextStyle(color: Colors.teal[800]),)),
                          ],
                        )


                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}