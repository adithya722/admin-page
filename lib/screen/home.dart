import 'package:adminpage/routes.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Dashboard'),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                    Color.fromARGB(255, 235, 159, 114),
                    Color.fromARGB(255, 233, 233, 233),
                  ])),
            )),
        body: Padding(
          padding: EdgeInsets.only(top: 55, left: 130),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {

                 
                  Navigator.pushNamed(context, Routes.register);
                },
                child:  Container(
                    height: 120,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/orders.png"),
                            fit: BoxFit.cover)),
                  ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Total orders",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color.fromARGB(255, 188, 95, 41),
                  )),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                 onTap: () {

                 
                  Navigator.pushNamed(context, Routes.prodtlist);
                },
                child: Container(
                  height: 120,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/orderlist.png"),
                          fit: BoxFit.cover)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Order List",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color.fromARGB(255, 188, 95, 41),
                  )),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                 onTap: () {

                 
                  Navigator.pushNamed(context, Routes.register);
                },
                child: Container(
                  height: 120,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/ve.png"),
                          fit: BoxFit.cover)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("User Verification",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color.fromARGB(255, 188, 95, 41),
                  )),
            ],
          ),
        ));
  }
}
