import 'package:calories_counter/domain/entities/products.dart';
import 'package:calories_counter/domain/interactors/search_interactor.dart';
import 'package:calories_counter/presentation/pages/main/tabs/search_body/cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchInteractor) : super(SearchInit());

  final SearchInteractor _searchInteractor;

  Future<void> getProductByName(String name) async {
    SearchLoading();
    try {
      final products = await _searchInteractor.getProducts(name);
      final product = products.items.first;
      final image = await _searchInteractor.getImageByName(product.name);
      emit(SearchFounded(product: product, image.hits.first.largeImageUrl));
    } catch (e) {
      print(e.toString());
      emit(SearchError());
    }
  }

  Future<void> addProduct(Product product) async {
    final user = await _searchInteractor.getUser();
    try {
      _searchInteractor.addProduct(product, user);
    } catch (e) {
      print(e.toString());
    }
  }
}
