import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telephone_directory_app_firebase/models/repositories/persondao_repository.dart';

class PersonDetailCubit extends Cubit<void> {
  // Kayıt sayfasında bize dönen bir değer olmadığı için void kullandık.
  
  PersonDetailCubit() : super(0); 
  // Varsayılan değer olarak 0 veriyoruz.

 var prepo = PersonsDaoRepository();
 // Repoya ulaşmak için tanımladık.

     Future<void> update(String personId, String personName, String personNumber ) async {
    await prepo.personUpdate(personId, personName, personNumber);
 
  }
// Repodaki işlemi buraya taşımış olduk.
  }

// Burada repo içerisinde yapacağımız işlemleri yöneteceğiz.