import 'package:fluttertest/Kisiler.dart';
import 'package:fluttertest/VeritabaniYardimcisi.dart';

class Kisilerdao{
  Future<List<kisiler>> tumkisiler()async{
    var db = await VeritabaniYardimcisi.veritabanierisim();
    List<Map<String,dynamic>> maps=await db.rawQuery("SELECT * FROM kisiler");
    return List.generate(maps.length, (i) {
      var satir=maps[i];
      return kisiler(satir["kisi_id"], satir["kisi_ad"], satir["kisi_yas"]);
    });
  }
  Future<void> kisiekle( String kisi_ad,int kisi_yas)async{
    var db = await VeritabaniYardimcisi.veritabanierisim();
    var bilgiler=Map<String,dynamic>();
    bilgiler["kisi_ad"]=kisi_ad;
    bilgiler["kisi_yas"]=kisi_yas;
    await db.insert("kisiler", bilgiler);
  }
  Future<void> kisisil(int kisi_id)async{
    var db = await VeritabaniYardimcisi.veritabanierisim();
    db.delete("kisiler", where: "kisi_id=?",whereArgs: [kisi_id]);
  }
    Future<void> kisiguncelle( String kisi_ad,int kisi_yas,int kisi_id)async{
    var db = await VeritabaniYardimcisi.veritabanierisim();

    var bilgiler=Map<String,dynamic>();
    bilgiler["kisi_ad"]=kisi_ad;
    bilgiler["kisi_yas"]=kisi_yas;
    
    await db.update("kisiler", bilgiler, where: "kisi_id=?", whereArgs: [kisi_id]);
  }

    Future<int> kayitkontrol(String kisi_ad)async{
    var db = await VeritabaniYardimcisi.veritabanierisim();
    List<Map<String,dynamic>> maps=await db.rawQuery("SELECT count(*) AS sonuc FROM kisiler where kisi_ad='$kisi_ad'");
    return maps[0]["sonuc"];
  }
    Future<kisiler> kisigetir(int kisi_id)async{
    var db = await VeritabaniYardimcisi.veritabanierisim();
    List<Map<String,dynamic>> maps=await db.rawQuery("SELECT * FROM kisiler WHERE kisi_id=$kisi_id");

    var satir=maps[0];
      return kisiler(satir["kisi_id"], satir["kisi_ad"], satir["kisi_yas"]);
  }
}