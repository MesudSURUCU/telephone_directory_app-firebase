import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telephone_directory_app_firebase/cubit/person_detail_cubit.dart';
import 'package:telephone_directory_app_firebase/models/entities/persons.dart';
import 'package:telephone_directory_app_firebase/presentation/components/text_field_name_widget.dart';
import 'package:telephone_directory_app_firebase/presentation/components/text_field_number_widget.dart';
import 'package:telephone_directory_app_firebase/presentation/views/home_page.dart';

class PersonDetailPage extends StatefulWidget {
  const PersonDetailPage({super.key, required this.person});
  final  Persons person;
  //HomePage sayfasında bu sayfaya geçiş yapıldığı zaman kişi bilgisini almak için tanımladık.

  @override
  State<PersonDetailPage> createState() => _PersonDetailPageState();
}

class _PersonDetailPageState extends State<PersonDetailPage> {

  var tfPersonName = TextEditingController();
  var tfPersonNumber = TextEditingController();

 @override
  void initState() {
    super.initState();
    var person = widget.person;
    // Burada gelen kişi nesnesi alınıp kullanılacak.
    // Direk erişemediğimiz için widget nesnesini kullanıyoruz.
    tfPersonName.text = person.personName;
    tfPersonNumber.text = person.personNumber;
    //Klavyeden alınan bilgi kişi nesnesinin bilgilerine aktarıldı.
    //Bu sayede sayfa açıldığı anda ad ve tel aktarılmış olacak.
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişi Detay"),
      ),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               TextFieldNameWidget(tfPersonName: tfPersonName),
                TextFieldNumberWidget(tfPersonNumber: tfPersonNumber),
                ElevatedButton(onPressed: (){
                context.read<PersonDetailCubit>().update(widget.person.personId, tfPersonName.text, tfPersonNumber.text);
                 // Kişi kayıt cubit sınıfının kayıt metodunu okuyarak klavyeden aldığımız bilgilerle kayıt işlemi gerçekleştiriyoruz.
                Navigator.push(context, MaterialPageRoute(builder: (context) =>const HomePage()));
                // update(widget.person.personId, tfPersonName.text, tfPersonNumber.text);
                 //Widget sayesinde eriştiğimiz personId bilgisini ve klavyeden aldığımız bilgileri güncelleme yapmak için kullanıyoruz.
                },
                 child: const Text("GÜNCELLE")),
            ]),
        ),
      ),
    );
  }
}

