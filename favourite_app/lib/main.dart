import 'package:favourite_app/bloc/favourite_bloc.dart';
import 'package:favourite_app/repository/favourite_repositry.dart';
import 'package:favourite_app/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => FavouriteBloc(FavouriteRepositry()),
        child: MaterialApp(
          home: HomeView(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
