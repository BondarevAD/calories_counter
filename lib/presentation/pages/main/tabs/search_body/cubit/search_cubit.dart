import 'package:calories_counter/domain/entities/products.dart';
import 'package:calories_counter/domain/interactors/search_interactor.dart';
import 'package:calories_counter/presentation/pages/main/tabs/search_body/cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchInteractor) : super(SearchInit());

  final SearchInteractor _searchInteractor;

  Future<Products> getProductByName(String name) {
    return _searchInteractor.getProducts(name);
  }
}
