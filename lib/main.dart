import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/blocs/authentication_bloc.dart';
import 'package:grocery_app/blocs/categories_bloc.dart';
import 'package:grocery_app/blocs/product_bloc.dart';
import 'package:grocery_app/views/screens/home_screen/home_screen.dart';
import 'package:grocery_app/views/screens/on_boarding_screen.dart';
import 'package:grocery_app/views/screens/sign_in_screen/sign_in_page.dart';

import 'repositories/authentication_respository.dart';

void main() {
  final authenticationRepository = AuthenticationRepository();
  final authenticationBloc = AuthenticationBloc(authenticationRepository);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(authenticationRepository),
        ),
        BlocProvider<CategoriesBloc>(
          create: (context) => CategoriesBloc(authenticationRepository: authenticationRepository, authenticationBloc: authenticationBloc,),
        ),
        // Add more Bloc providers as needed
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery app',
      initialRoute: '/boardingScreen',
      routes: {
        '/boardingScreen': (context) => OnboardingScreen(),
        '/': (context) => SignInPage(),
        '/home': (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
