import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Anasayfa extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePage();
  }
}

class HomePage extends State<Anasayfa>
{

  final Firestore _firestore = Firestore.instance;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Anasayfa"),
          backgroundColor: Colors.pink,
        ),

        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("Veri ekleme"),
                  onPressed: (){
                    Map<String, dynamic> addData = Map();
                    addData["isim"] = "Feyza Eda";
                    addData["yas"] = 21;


                   _firestore.collection("users").document("ogrenci").setData(addData);

                   addData["isim"] = "Hatice Nur";
                   addData["yas"]= 23;

                   _firestore.collection("users").document("ogrenci").setData(addData);

                  },
                ),
                RaisedButton(
                  child: Text("Veri silme"),
                  onPressed: (){
                    _firestore.document("users/ogrenci").delete();
                    _firestore.document("users/ogrenci").updateData({"isim": FieldValue.delete()});

                  },
                ),
                RaisedButton(
                  child: Text("Veri güncelleme"),
                  onPressed: (){
                    _firestore.document("userd/ogrenci").updateData({"isim" : "Kadriye"});
                  },
                ),
                RaisedButton(
                  child: Text("Veri okuma"),
                  onPressed: ()async{
                    DocumentSnapshot documentSnapshot = await _firestore.document("users/ogrenci").get();
                    debugPrint("ogrenci ismi: "+ documentSnapshot.data["isim"].toString());
                    debugPrint("öğrencinin özlellikleri**************************************************** "+ documentSnapshot.data.toString());
                    debugPrint("öğrencinin yaşı------------------------------------------------ "+documentSnapshot.data["yas"].toString());
                    }

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
