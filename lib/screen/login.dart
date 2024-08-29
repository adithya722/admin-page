import 'package:adminpage/routes.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     

        body: ListView(
      children: [
        
         Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             
             
              Container(
                margin: const EdgeInsets.only(top: 10),
                child:
                    

                    Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Text(
                      "Sign in to you're account",
                      style: TextStyle(
                        fontSize: 23,
                        color: Color.fromARGB(255, 51, 29, 3),
                        shadows: const [
                          Shadow(
                            blurRadius: 10.0,
                            color: Color.fromARGB(255, 133, 83, 23),
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
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
              //       ),
              //     )
              //   ],
              // ),

              SizedBox(
                height: 35,
              ),
              Padding(padding: EdgeInsets.only(left: 12, right: 55)),
              
              TextField(
                controller: email,
                decoration: InputDecoration(
                  labelText: "Email ID",
                  icon: Icon(Icons.email),
                  iconColor: Color.fromARGB(255, 64, 34, 4),
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
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                  labelText: "Password ",
                  icon: Icon(Icons.lock_open),
                  iconColor: Color.fromARGB(255, 64, 39, 4),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 25),

              MaterialButton(
                onPressed: () {
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email.text.trim(), password: password.text.trim());

                      Navigator.of(context).pushReplacementNamed(Routes.home);
                      
                        
                        showDialog(
                      context: context,
                      builder: (context) {
                        Future.delayed(Duration(seconds: 1), () {
                          Navigator.of(context).pop(true);
                        });
                        return AlertDialog(
                         title: Text("Success"),
                                content: Text("Saved successfully"),
                        );
                      });

                  
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
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Not a member?",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 64, 42, 3),
                      )),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.register);
                    },
                    child: Text("Register",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color.fromARGB(255, 46, 31, 2),
                        )),
                  )
                ],
              ),
              // TextButton(
              //       onPressed: () {
              //         Navigator.pushNamed(context, Routes.register);
              //       },

              //       child:
              //        Text("Register",
              //           style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 16,
              //             color: Color.fromARGB(255, 2, 46, 25),
              //           )),
              //     )
            ],
          ),
    
      ],
    ));
  }
}
