import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_app/bloc/image_picker_events.dart';
import 'package:image_picker_app/bloc/image_picker_states.dart';
import 'package:image_picker_app/utils/image_picker_utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvents, ImagePickerStates> {
  final ImagePickerUtils utils;
  ImagePickerBloc(this.utils) : super(ImagePickerStates()) {
    on<CameraCapture>(cameraCapture);
    on<GalleryCapture>(galleryCapture);
  }

  void cameraCapture(
      CameraCapture event, Emitter<ImagePickerStates> states) async {
    XFile? file = await utils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void galleryCapture(
      GalleryCapture event, Emitter<ImagePickerStates> states) async {
    XFile? file = await utils.galleryCapture();
    emit(state.copyWith(file: file));
  }
}
