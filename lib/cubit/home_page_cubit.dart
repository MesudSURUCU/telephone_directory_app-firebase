import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telephone_directory_app_firebase/models/entities/persons.dart';
import 'package:telephone_directory_app_firebase/models/repositories/persondao_repository.dart';

class HomePageCubit extends Cubit<List<Persons>> {
  // Bu sayfada yapılan arama, silme ve genel gösterim liste döndüğü için kişiler listesini tanımladık.

HomePageCubit() : super(<Persons>[]);

var prepo = PersonsDaoRepository();
var refPersons = FirebaseDatabase.instance.ref().child("kisiler"); // Child'ın içindeki text veritabanı ile birebir aynı olmalıdır. 
// Bu kodlamayla databasedeki bilgilere erişebilmenin önünü açıyoruz.


Future<void> personsUpload() async {

refPersons.onValue.listen((event) {
  
var incomingValues = event.snapshot.value as dynamic; // Gelen değerleri alıyoruz. 

if(incomingValues != null) {

var list = <Persons>[];

incomingValues.forEach((key, object) {
  var person = Persons.fromJson(key, object);
  list.add(person);
});
emit(list);

}

});// Bu kodlama veri tabanını okumamızı sağladığı gibi silme, güncelleme, ekleme olduğu zaman otomatik tetiklenir ve ara yüzde bunu görürüz.


// var list = await prepo.getAllPersons();
// Repo aracılığıyla bir listeyi alıyoruz.

// emit(list);
//Emit ederek anasayfa cubiti dinleyen her yere bu listeyi aktarmış oluyoruz.


} 
Future<void> search(String searchWord) async {

refPersons.onValue.listen((event) {
  
var incomingValues = event.snapshot.value as dynamic; // Gelen değerleri alıyoruz. 

if(incomingValues != null) {

var list = <Persons>[];

incomingValues.forEach((key, object) {
  var person = Persons.fromJson(key, object);
  if(person.personName.contains(searchWord)){
    list.add(person);
  }
  
});
emit(list);

}

});


 // var list = await prepo.personSearch();
// Repo aracılığıyla arama sonucuna göre bir listeyi alıyoruz.

 // emit(list);
//Emit ederek anasayfa cubiti dinleyen her yere bu listeyi aktarmış oluyoruz.

}



     Future<void> delete(String personId) async {
    await prepo.personDelete(personId);
    await personsUpload();
  }
}


//İşlemler repoda yapılıyor. Anasayfa Cubit ise bize değer getirecek.

//Okuma ve arama fonksiyonlarını repoda değilde burada gerçekleştirmemizin sebebi veri tabanını ile çalışırken repodan veri iletemiyor. 
//Bu yüzden cubitten yapılmalı ve emit edilmeli. Firebase'in callback yapısı veri iletmeye müsait değil. Sadece emit gibi yapılarla arayüze veri 
//gönderebiliriz. Diğer kaydetme ve güncelleme işlemlerini repoda yapabiliriz.