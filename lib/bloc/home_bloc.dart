import 'package:bloc/bloc.dart';
import 'package:flutter_assignment/bloc/home_state.dart';
import 'package:flutter_assignment/model/home_response.dart';
import 'package:flutter_assignment/services/home_repository.dart';

import 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc(this.homeRepository);

  @override
  HomeState get initialState => EmptyState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is FetchHomeResponse) {
      yield HomeLoading();
      try {
        final HomeResponse response = await homeRepository.fetchHomeResponse();
        if (response != null) {
          yield HomeDataLoaded(response);
        } else {
          yield HomeDataEmpty();
        }
      } on Exception catch (_) {
        yield ErrorFetch();
      }
    }
  }
}
