import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Kayit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePage();
  }
}

class HomePage extends State<Kayit> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final parolaController = TextEditingController();

  void yaziDegis(yeni) {
    setState(() {
      //girilenMetin = yeni;
    });
  }


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
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.text, //klavye tipi
                  maxLength: 20, //alabilecek max karakter
                  cursorColor: Colors.pink, //imleç rengi
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.wb_sunny), //başına ikon
                      hintText: "Email", //y silik yazı
                      suffixIcon: Icon(Icons.brightness_3), //sonuna ikon
                      labelText: "Kullanıcı adı", //tıklandığında yazarken de hala yukarıda kalır
                      border: OutlineInputBorder(  //dışını kutu içine alır
                          borderRadius: BorderRadius.all(
                              Radius.circular(10))
                      ),
                      filled: true, // fillColor ile renk kodunu çalıştırmak için true olmalı
                      fillColor: Colors.red.shade50 // arkafonun rengi
                  ),
                  controller: emailController,  // girilen veriyi kontrol etmek için ekliyoruz
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  obscureText: true,  //gizlenebilirlik açık
                  maxLength: 8,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key),
                    hintText: "Parola",
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  controller: parolaController,
                ),
                RaisedButton(
                  child: Text(
                      "Giriş yap"),
                  color: Colors.pink[200],
                  onPressed: (){
                    _auth.createUserWithEmailAndPassword(email: emailController.text, password: parolaController.text).catchError((hata) => debugPrint("hata: " + hata.toString()));


                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}