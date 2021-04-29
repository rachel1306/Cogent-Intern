import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cogent_ecomm_app/InsideApp/Categories/fruits.dart';
class categories extends StatefulWidget {
  @override
  _categoriesState createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  final CollectionReference _productRef=FirebaseFirestore.instance.collection('Products');
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<QuerySnapshot>(
        future: _productRef.get(),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Scaffold(
              body: Center(
                child: Text("Error: ${snapshot.error}"),
              ),
            );
          }
          if(snapshot.connectionState == ConnectionState.done){
            return ListView(
              children: snapshot.data.docs.map((document) {
                return Container(
                  child: Row(
                    children: [
                    ],
                  ),
                );
              }).toList()
            );
          }
          return Scaffold(
              body: Center(child: CircularProgressIndicator(),),
              );
        },
      ),
    );
  }
}
