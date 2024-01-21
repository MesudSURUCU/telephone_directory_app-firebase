import 'package:firebase_database/firebase_database.dart';

class PersonsDaoRepository {
var refPersons = FirebaseDatabase.instance.ref().child("kisiler");


  Future<void> personRegistration(
      String personName, String personNumber) async {
      var info = Map<String,dynamic>();
      info["kisi_id"] = "";
      info["kisi_ad"] = personName;
      info["kisi_tel"] = personNumber;
      refPersons.push().set(info);

      // print("Kişi Kayıt : $personName - $personNumber");
  } // Bu fonksiyonu cubitte çalıştıracağız. O yüzden orada bu sınıftan bir nesneye ihtiyacımız var.

  Future<void> personUpdate(
      String personId, String personName, String personNumber) async {
     var info = Map<String,dynamic>();
      
      info["kisi_ad"] = personName;
      info["kisi_tel"] = personNumber;
      refPersons.child(personId).update(info);
      



   // print("Kişi Güncelle : $personId - $personName - $personNumber");
  }

  Future<void> personDelete(String personId) async {
    
    refPersons.child(personId).remove();
    
    //print("Kişi Sil : $personId");
  }
}

//Repolar içerisinden cubitlere veri aktarılır.
//Cubitlerin işlemleri burada yapılır.
//Burada yapılan işlemin amacı veri tabanında kayıt yapmak.
