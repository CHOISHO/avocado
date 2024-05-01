import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/data/repository/weather_repository.dart';
import 'package:avocado/domain/model/weather_model.dart';

part 'home_view_model.freezed.dart';
part 'home_view_model.g.dart';

@freezed
class HomeViewModelState with _$HomeViewModelState {
  factory HomeViewModelState({
    @Default(Weather()) Weather weather,
  }) = _HomeViewModelState;

  factory HomeViewModelState.fromJson(Map<String, dynamic> json) => _$HomeViewModelStateFromJson(json);
}

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  Future<HomeViewModelState> build() async {
    Weather? ultraShortTermLive = await ref.watch(weatherRepositoryProvider.notifier).getUltraShortTermLive();

    return Future.value(
      HomeViewModelState(
        weather: ultraShortTermLive ?? const Weather(),
      ),
    );
  }
}
