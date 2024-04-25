import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:avocado/data/repository/weather_repository.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  build() {
    print(ref.read(weatherRepositoryProvider));
  }
}
