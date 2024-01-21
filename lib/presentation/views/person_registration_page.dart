import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telephone_directory_app_firebase/cubit/person_registration_cubit.dart';
import 'package:telephone_directory_app_firebase/presentation/views/home_page.dart';

class PersonRegistrationPage extends StatefulWidget {
  const PersonRegistrationPage({super.key});

  @override
  State<PersonRegistrationPage> createState() => _PersonRegistrationPageState();
}

class _PersonRegistrationPageState extends State<PersonRegistrationPage> {
  
  
  var tfPersonName = TextEditingController();
  var tfPersonNumber = TextEditingController();

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Kişi Kayıt"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               TextField(
                  controller: tfPersonName,
                  decoration: const InputDecoration(hintText: "Kişi ad"),
                ),
                TextField(
                  controller: tfPersonNumber,
                  decoration: const InputDecoration(hintText: "Kişi tel"),
                ),
                ElevatedButton(onPressed: (){
                context.read<PersonRegistrationCubit>().registration(tfPersonName.text, tfPersonNumber.text);
                // Kişi kayıt cubit sınıfının kayıt metodunu okuyarak klavyeden aldığımız bilgilerle kayıt işlemi gerçekleştiriyoruz.
                Navigator.push(context, MaterialPageRoute(builder: (context) =>const HomePage()));


                 // registration(tfPersonName.text, tfPersonNumber.text);
                  // Kayıt için kkavyeden girilen bilgiyi text'e çevirdik ve kayıt metodundaki istenilen bilgilere atadık.
                },
                 child: const Text("KAYDET"))
            ]),
        ),
      ),
    );
  }
}