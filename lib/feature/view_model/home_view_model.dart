import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/data/repository/weather_repository.dart';
import 'package:avocado/domain/model/weather_model.dart';

part 'home_view_model.freezed.dart';
part 'home_view_model.g.dart';

@freezed
class HomeViewModelState with _$HomeViewModelState {
  const factory HomeViewModelState({
    @Default(null) Weather? weather,
  }) = _HomeViewModelState;

  factory HomeViewModelState.fromJson(Map<String, dynamic> json) =>
      _$HomeViewModelStateFromJson(json);
}

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  Future<HomeViewModelState> build() async {
    return await _init();
  }

  Future<HomeViewModelState> _init() async {
    Weather? weather = await ref.read(weatherRepositoryProvider.notifier).get();

    return HomeViewModelState(
      weather: weather,
    );
  }

  Future<void> setDistrict(String value) async {
    Weather? weather = await ref
        .read(weatherRepositoryProvider.notifier)
        .getUltraShortTermForecast(value);

    final previousState = state.asData!.value;
    state = AsyncData(previousState.copyWith(weather: weather));
  }
}
