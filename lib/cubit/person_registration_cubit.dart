import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telephone_directory_app_firebase/models/repositories/persondao_repository.dart';

class PersonRegistrationCubit extends Cubit<void> {
  // Kayıt sayfasında bize dönen bir değer olmadığı için void kullandık.
  
  PersonRegistrationCubit() : super(0); 
  // Varsayılan değer olarak 0 veriyoruz.

 var prepo = PersonsDaoRepository();

  Future<void> registration(String personName, String personNumber ) async {
  await prepo.personRegistration(personName, personNumber);
// Repodaki işlemi buraya taşımış olduk.
  }

 


}

// Burada repo içerisinde yapacağımız işlemleri yöneteceğiz.