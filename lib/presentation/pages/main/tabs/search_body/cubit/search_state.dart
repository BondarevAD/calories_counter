import 'package:calories_counter/domain/entities/products.dart';

sealed class SearchState {}

class SearchInit extends SearchState {}

class SearchFounded extends SearchState {
  final Product product;
  final String imageUrl;

  SearchFounded(this.imageUrl, {required this.product});
}

class SearchLoading extends SearchState {}

class SearchError extends SearchState {}
