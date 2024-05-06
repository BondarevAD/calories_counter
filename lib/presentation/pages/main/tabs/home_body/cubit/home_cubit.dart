import 'package:calories_counter/domain/entities/products.dart';
import 'package:calories_counter/domain/entities/user.dart';
import 'package:calories_counter/domain/interactors/home_interactor.dart';
import 'package:calories_counter/domain/repositories/products_repository.dart';
import 'package:calories_counter/domain/repositories/user_repository.dart';
import 'package:calories_counter/presentation/pages/main/tabs/home_body/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._interactor) : super(HomeInitial());

  final HomeInteractor _interactor;

  Future<void> getProductsByUser() async {
    try {
      final products = await _interactor.getProductsByUser();
      emit(HomeLoaded( products));
    } catch (e) {
      print(e.toString());
    }
  }
}
