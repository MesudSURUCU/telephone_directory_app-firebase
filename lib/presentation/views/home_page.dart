import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telephone_directory_app_firebase/constants/constants.dart';
import 'package:telephone_directory_app_firebase/cubit/home_page_cubit.dart';
import 'package:telephone_directory_app_firebase/models/entities/persons.dart';
import 'package:telephone_directory_app_firebase/presentation/views/person_detail.dart';
import 'package:telephone_directory_app_firebase/presentation/views/person_registration_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearching = false;
  //Başlangıçta arama yapılmadığını belirtiyoruz.

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().personsUpload();
    // Bu kodlama sayesinde ana sayfa açıldığı anda bu fonksiyon çalışır ve arayüzde kişiler gözükür. 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                decoration: const InputDecoration(hintText: "Ara"),
                onChanged: (searchResult) {
                 context.read<HomePageCubit>().search(searchResult);
                
                
                //  print("Arama sonucu : $searchResult");
                  //Bu sayede arama yapılıp yapılmadığına göre title da yazan yazıyı kontrol edebildeceğiz.
                  // Arama yapılma esnasında oluşturduğumuz TextField sayesinde arama sonucunu alabiliyoruz.
                },
              )
            : const Text("Kişiler"),
        actions: [
          isSearching
              ? IconButton(
                  onPressed: () {
                     context.read<HomePageCubit>().personsUpload();
                    setState(() {
                      isSearching = false;
                      //Arama durumunu yapılmıyor olarak günceller.
                    });
                  },  
                  icon: const Icon(Icons.cancel))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                    //Arama durumunu yapılıyor olarak günceller.
                  },
                  icon: const Icon(Icons.search)),
          // Bu işlemler ile birlikte arama durumuna göre yapılacak işlemleri ve gösterilecek iconları yönlendirebiliyoruz.
        ],
      ),
      body: BlocBuilder<HomePageCubit, List<Persons>>( // Bloc kullandığımız için FutureBuilder yerine BlocBuilder kullanıyoruz.
       // future: showAllPersons(),
        builder: ((context,/* snapshot */ personsList) {
          // Snapshot bilgi var mı yok mu, veriyi nasıl alacağız sorularını cevaplamak için kullanılan yapıdır.
          if (/*snapshot.hasData*/ personsList.isNotEmpty) {
            // var personsList = snapshot.data; Listem zaten var gerek kalmadı.
            return ListView.builder(
                itemCount: personsList // ! nullable olma durumu kalmadığı için ! işareti kullanmaya gerek kalmadı.
                    .length, // Kİşiler listesinin uzunluğu kadar bilgi getirir. Nullable özelliğinden dolayı ! işareti koyuyoruz.
                itemBuilder: (context, indeks) {
                  var person = personsList[indeks];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PersonDetailPage(
                                        person: person,
                                      )))
                          // Bu sayfada içi doldurulan person nesnesi gidilen sayfaya bu şekilde aktarılıyor.
                          .then((value) {
                        print("Anasayfa'ya dönüldü");
                      });
                    },
                    child: Card(
                      child: Padding(
                        padding: Constants.all8,
                        child: Row(
                          children: [
                            Text(
                                "${person.personName} - ${person.personNumber}"),
                           const Spacer(),
                            IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("${person.personName} silinsin mi ?"),
                                  action: SnackBarAction(
                                    label: "EVET", 
                                    onPressed: (){
                                     context.read<HomePageCubit>().delete(person.personId);
                                    }),));
                              },
                              icon: const Icon(Icons.delete_outline),
                              color: Constants.pinkColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return const Center();
          }
          // Bu işlemler sayesinde bilgi var mı yok mu buna bakıyoruz ve varsa bilgiye listenin içeriğini tanıtıyoruz.
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PersonRegistrationPage()))
              .then((value) {
            print("Anasayfa'ya dönüldü");
          });
          // Gelinen sayfaya geri dönüldüğünü geçişe eklememiz gerekiyor. Çünkü geri döndüğümüz zaman ara yüzde değişiklikler yapacağız.
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
