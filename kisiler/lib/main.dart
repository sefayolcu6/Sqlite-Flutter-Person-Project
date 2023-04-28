import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertest/Kisilerdao.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(deneme());
}

class deneme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> kisilerigoster() async {
    var liste = await Kisilerdao().tumkisiler();
    for (var k in liste) {
      print("***********");
      print("kisi Id: ${k.kisi_id}");
      print("kisi adi: ${k.kisi_ad}");
      print("kisi yas: ${k.kisi_yas}");
    }
  }

  Future<void> getir() async {
    var kisi = await Kisilerdao().kisigetir(1);
    print("******KİŞİ GETİR*****");
    print("kisi Id: ${kisi.kisi_id}");
    print("kisi adi: ${kisi.kisi_ad}");
    print("kisi yas: ${kisi.kisi_yas}");
  }

  Future<void> ekle() async {
    await Kisilerdao().kisiekle("sedat", 37);
  }

  Future<void> guncelle() async {
    await Kisilerdao().kisiguncelle(" yeni sedat", 52, 2);
  }

  Future<void> kayitkontrol() async {
    int sonuc = await Kisilerdao().kayitkontrol("ahmet");
    print("veritabanında ahmet sayısı: $sonuc");
  }

  Future<void> sil() async {
    await Kisilerdao().kisisil(3);
  }

  @override
  void initState() {
    // ekle();
    //sil();
    //guncelle();
    //kayitkontrol();
    getir();
    kisilerigoster();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
