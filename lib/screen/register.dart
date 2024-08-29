import 'dart:io';


import 'package:adminpage/routes.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  File? pic;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
      
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
             
              children: [
              
                Container(
                  margin: EdgeInsets.only(top: 11),
                  child:
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   children: [
                      //     IconButton(
                      //         onPressed: () async {
                      //           FirebaseAuth.instance.signOut();
                      //         },
                      //         icon: Icon(
                      //           Icons.logout,
                      //           color: Color.fromARGB(255, 4, 64, 35),
                      //         ))
                      //   ],
                      // ),
          
                      Row(
                        children: [
                          Text(
                    "Welcome to E-Shop",
                    style: TextStyle(
                          fontSize: 33,
                          color: Color.fromARGB(255, 51, 29, 3),
                          shadows: const [
                            Shadow(
                              blurRadius: 10.0,
                              color: Color.fromARGB(255, 133, 83, 23),
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                    ),
           
                  ),
                        ],
                      ),
                ),
                SizedBox(
                  height: 12,
                ),
                // Column(
                //   children: [
                
                //     GestureDetector(
                //       onTap: () async {
                //         XFile? image = await ImagePicker()
                //             .pickImage(source: ImageSource.gallery);
                //         File newfile = File(image!.path);
                //         setState(() {
                //           pic = newfile;
                //         });
                //       },
                //       child: CircleAvatar(
                //         backgroundImage: pic != null ? FileImage(pic!) : null,
                //         backgroundColor: Colors.white,
                //       ),
                //     )
                //   ],
                // ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    labelText: "Email ID",
                    icon: Icon(Icons.email),
                    iconColor:  Color.fromARGB(255, 84, 35, 7),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password ",
                    icon: Icon(Icons.lock_open),
                    iconColor:  Color.fromARGB(255, 84, 35, 7),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 25),
              GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email.text.trim(), password: password.text.trim());
                    
                    Navigator.pushReplacementNamed(context, Routes.login);
                  },
                  child: Container(
                        width: 82,
                        height: 34,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 84, 35, 7),
                              Color.fromARGB(255, 155, 210, 191),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(5, 5),
                              blurRadius: 7,
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
