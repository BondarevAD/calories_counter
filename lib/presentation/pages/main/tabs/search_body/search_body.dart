import 'package:calories_counter/presentation/pages/main/tabs/search_body/cubit/search_cubit.dart';
import 'package:calories_counter/presentation/pages/main/tabs/search_body/cubit/search_state.dart';
import 'package:calories_counter/presentation/widgets/search_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SearchCubit>(context);
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          SearchTextField(
            onChanged: (query) {
              cubit.getProductByName(query);
            },
          ),
          BlocBuilder<SearchCubit, SearchState>(builder: (contex, state) {
            if (state is SearchFounded) {
              return Text(state.product.name);
            } else if (state is SearchError) {
              return Text("error");
            } else if (state is SearchLoading) {
              return CircularProgressIndicator();
            } else {
              return Container();
            }
          })
        ],
      ),
    );
  }
}
