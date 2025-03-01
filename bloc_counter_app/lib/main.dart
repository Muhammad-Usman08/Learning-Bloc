import 'package:bloc_counter_app/bloc/counter_bloc.dart';
import 'package:bloc_counter_app/ui/counter_view.dart';
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
      create: (_)=> CounterBloc(),
      child: const MaterialApp(
        home: CounterView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
