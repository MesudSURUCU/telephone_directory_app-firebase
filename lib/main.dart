import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telephone_directory_app_firebase/cubit/home_page_cubit.dart';
import 'package:telephone_directory_app_firebase/cubit/person_detail_cubit.dart';
import 'package:telephone_directory_app_firebase/cubit/person_registration_cubit.dart';
import 'package:telephone_directory_app_firebase/firebase_options.dart';
import 'package:telephone_directory_app_firebase/presentation/views/home_page.dart';

Future<void> main() async {

   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
   );
   // Firebase Database'in uygulamaya tanıtılması için gerekli kodlama.

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(// Her sayfa için oluşturulacak cubitleri burada uygulamaya tanıtıyoruz.
      providers: [
        BlocProvider(create: (context) => PersonRegistrationCubit()),
        BlocProvider(create: (context) => PersonDetailCubit()),
        BlocProvider(create: (context) => HomePageCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage()
      ),
    );
  }
}

