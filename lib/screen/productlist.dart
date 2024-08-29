import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Productlist extends StatefulWidget {
  const Productlist({super.key});

  @override
  State<Productlist> createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
  final CollectionReference productlist =
      FirebaseFirestore.instance.collection("Products");
  @override
  Widget build(BuildContext context) {
    return Scaffold(  body: StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("Products")
         
          .snapshots(),
      builder: (BuildContext context, snapshot) {
        final data = snapshot.data?.docs;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (data!.isEmpty) {
          return const Center(child: Text("List Empty"));
        } 
        
        else {
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                final Productsnap = data[index].data();
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    shape: Border.symmetric(horizontal: BorderSide.none,vertical: BorderSide.none),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: ListTile(
                      leading: Image.network(Productsnap["image"]),
                      title: Text(Productsnap["Brand Name"]),
                      subtitle: Text("price: ${Productsnap["Price"]}\n email:${Productsnap["email"]}\n description:${Productsnap["Description"]}"),
                      
                      trailing: SizedBox(
                        width: MediaQuery.of(context).size.width*0.07,
                         height:MediaQuery.of(context).size.height,
                        child: Row(
                          
                          children: [
                            SizedBox(width: 89,),
                            IconButton(
                                onPressed: () {
                                  FirebaseStorage.instance
                                      .refFromURL(Productsnap["image"])
                                      .delete();
                                  FirebaseFirestore.instance
                                      .doc("Products/${data[index].id}")
                                      .delete();
                                },
                                icon: Icon(Icons.delete)),
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        }
      },
    ));
  }
}