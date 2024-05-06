import 'package:calories_counter/data/entities/day.dart';
import 'package:calories_counter/domain/entities/products.dart';

sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  HomeLoaded(this.days);

  List<DayData> days;
}

class HomeError extends HomeState {}
