import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../services/db_service.dart';
import 'model/user_model.dart';

class SignUp extends StatefulWidget {
  static const String id = 'sign_up';

  const SignUp({Key? key}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();
  doLogin() async{
    String email = emailController.text.toString().trim();
    String number = numberController.text.toString().trim();
    String address = addressController.text.toString().trim();

    var user = User.account( email: email,number: number, address: address);

    HiveDB().storeUser(user);
    var user2 = HiveDB().loadUser();
    print(user2.email);
    print(user2.number);
    print(user2.address);
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
                  Text("Welcome", style: TextStyle(color: Colors.grey[300], fontSize: 18),),
                  const SizedBox(height: 10,),
                  const Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),),
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
                        const Text("Number", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        const SizedBox(height: 10,),
                        TextField(
                          controller: numberController,
                          decoration: const InputDecoration(
                            hintText: "Enter Number",
                          ),
                        ),
                        const SizedBox(height: 30,),
                        const Text("Address", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        const SizedBox(height: 10,),
                        TextField(
                          controller: addressController,
                          decoration: const InputDecoration(
                            hintText: "Enter Address",
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
                              child: Text("Sign Up", style: TextStyle(color: Colors.white,fontSize: 20),),
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