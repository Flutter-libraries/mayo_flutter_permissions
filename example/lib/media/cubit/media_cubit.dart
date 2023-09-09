import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mayo_flutter_permissions/mayo_flutter_permissions.dart';

part 'media_cubit.freezed.dart';
part 'media_state.dart';

class MediaCubit extends Cubit<MediaState> {
  MediaCubit() : super(const MediaState());

  final picker = ImagePicker();

  final PermissionsRepository _permisrepository = PermissionsRepository();

  Future<void> pickImageFromLibrary() async {
    _permisrepository.isPhotosPermissionsDenied().then((value) async {
      if (value) {
        emit(state.copyWith(isPhotoPermissionsDenied: true));
      } else {
        final path = await _pickImageFromSource(ImageSource.gallery);
        emit(state.copyWith(localPathPhoto: path));
      }
    });
  }

  Future<void> pickImageFromCamera() async {
    _permisrepository.isCameraPermissionsDenied().then((value) async {
      if (value) {
        emit(state.copyWith(isPhotoPermissionsDenied: true));
      } else {
        final path = await _pickImageFromSource(ImageSource.camera);
        emit(state.copyWith(localPathCamera: path));
      }
    });
  }

  Future<String> _pickImageFromSource(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    return pickedFile!.path;
  }

  Future<void> openSettings() async {
    await _permisrepository.openSettings();
  }
}
