import 'package:dsa_learning/domain/handlers/images/iselect_image_handler.dart';
import 'package:dsa_learning/domain/storage/ilocal_storage.dart';
import 'package:dsa_learning/presentation/initial/main/profile/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required ILocalStorage localStorage,
    required ISelectImageHandler selectImageHandler,
  })  : _localStorage = localStorage,
        _selectImageHandler = selectImageHandler,
        super(const ProfileState());

  final ILocalStorage _localStorage;
  final ISelectImageHandler _selectImageHandler;

  Future<void> init() async {}
}
