import 'package:calories_counter/presentation/pages/main/tabs/home_body/cubit/home_cubit.dart';
import 'package:calories_counter/presentation/pages/main/tabs/home_body/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return const Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Keep it up!"),
                Text("You've tracked"),
                Text("3 days in row"),
              ],
            ),
          );
        },
      ),
    );
  }
}
