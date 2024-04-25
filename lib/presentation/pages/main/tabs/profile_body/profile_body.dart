import 'package:calories_counter/presentation/pages/main/tabs/profile_body/cubit/profile_cubit.dart';
import 'package:calories_counter/presentation/pages/main/tabs/profile_body/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProfileLoaded) {
          return Text(state.user.email + state.user.id);
        }
        if (state is ProfileError) {
          return Text("Error");
        } else {
          return Container();
        }
      },
    );
  }
}
