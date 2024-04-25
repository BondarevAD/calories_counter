import 'package:calories_counter/domain/entities/user.dart';
import 'package:calories_counter/domain/interactors/profile_interactor.dart';
import 'package:calories_counter/presentation/pages/main/tabs/profile_body/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileInteractor _profileInetractor;

  ProfileCubit(this._profileInetractor) : super(ProfileInitial());

  Future<void> getUser() async {
    emit(ProfileLoading());
    try {
      final user = await _profileInetractor.getUser();
      emit(ProfileLoaded(user));
    } on Exception {
      emit(ProfileError());
    }
  }
}
