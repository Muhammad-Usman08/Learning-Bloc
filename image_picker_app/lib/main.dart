import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_app/bloc/image_picker_bloc.dart';
import 'package:image_picker_app/ui/home_view.dart';
import 'package:image_picker_app/utils/image_picker_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_)=> ImagePickerBloc(ImagePickerUtils()),
        child: MaterialApp(
          home: HomeView(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
