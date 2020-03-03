
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class FetchHomeResponse extends HomeEvent {
  @override
  String toString() => "FetchHome";
}