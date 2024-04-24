import 'package:calories_counter/domain/entities/products.dart';

sealed class SearchState {}

class SearchInit extends SearchState {}

class SearchFounded extends SearchState {
  final Product product;

  SearchFounded({required this.product});
}

class SearchError extends SearchState {}
