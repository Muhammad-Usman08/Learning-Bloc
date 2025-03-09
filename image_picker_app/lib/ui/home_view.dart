import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_app/bloc/image_picker_bloc.dart';
import 'package:image_picker_app/bloc/image_picker_events.dart';
import 'package:image_picker_app/bloc/image_picker_states.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home View',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[400],
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              context.read<ImagePickerBloc>().add(CameraCapture());
            },
            child: const CircleAvatar(
              child: Icon(Icons.camera),
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              context.read<ImagePickerBloc>().add(GalleryCapture());
            },
            child: const CircleAvatar(
              child: Icon(Icons.photo),
            ),
          ),
          BlocBuilder<ImagePickerBloc, ImagePickerStates>(
              builder: (context, state) {
            if (state.file == null) {
              return Container();
            } else {
              return Image.file(File(state.file!.path.toString()));
            }
          }),
        ],
      ),
    );
  }
}
