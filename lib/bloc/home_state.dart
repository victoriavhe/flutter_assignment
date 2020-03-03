import 'package:equatable/equatable.dart';
import 'package:flutter_assignment/model/home_response.dart';

abstract class HomeState extends Equatable {}

class EmptyState extends HomeState {}

class HomeLoading extends HomeState {}

class HomeDataLoaded extends HomeState {
  final HomeResponse home;

  HomeDataLoaded(this.home);
}

class HomeDataEmpty extends HomeState {}

class NoInternetConnection extends HomeState {}

class ErrorFetch extends HomeState {}
