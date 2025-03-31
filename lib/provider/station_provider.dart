import 'package:flutter_riverpod/flutter_riverpod.dart';

// 출발역과 도착역을 관리하는 상태 클래스
class StationState {
  final String? departureStation;
  final String? arrivalStation;

  StationState({this.departureStation, this.arrivalStation});

  StationState copyWith({String? departureStation, String? arrivalStation}) {
    return StationState(
      departureStation: departureStation ?? this.departureStation,
      arrivalStation: arrivalStation ?? this.arrivalStation,
    );
  }
}

// StationState를 관리하는 StateNotifier
class StationNotifier extends StateNotifier<StationState> {
  StationNotifier() : super(StationState());

  void setDepartureStation(String station) {
    state = state.copyWith(departureStation: station);
  }

  void setArrivalStation(String station) {
    state = state.copyWith(arrivalStation: station);
  }
}

// 전역적으로 사용할 Provider
final stationProvider = StateNotifierProvider<StationNotifier, StationState>((ref) {
  return StationNotifier();
});