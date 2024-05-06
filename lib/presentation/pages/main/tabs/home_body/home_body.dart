import 'package:calories_counter/presentation/pages/main/tabs/home_body/cubit/home_cubit.dart';
import 'package:calories_counter/presentation/pages/main/tabs/home_body/cubit/home_state.dart';
import 'package:calories_counter/presentation/pages/main/tabs/home_body/info_page/info_page.dart';
import 'package:calories_counter/presentation/pages/main/tabs/home_body/widgets/days_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as get_x;

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getProductsByUser();
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            return Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Keep it up!",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "You've tracked",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "3 days in row",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () => get_x.Get.to(
                        InfoPage(
                          days: state.days,
                        ),
                        transition: get_x.Transition.downToUp),
                    child: DaysSection(
                      days: state.days,
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
