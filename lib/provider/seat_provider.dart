import 'package:flutter_riverpod/flutter_riverpod.dart';

// 좌석 상태를 관리하는 클래스
class SeatState {
  final List<List<bool>> seats; // 20행 4열의 좌석 상태 (true: 선택됨, false: 선택 안됨)

  SeatState(this.seats);

  SeatState copyWith({List<List<bool>>? seats}) {
    return SeatState(seats ?? this.seats);
  }
}

// SeatState를 관리하는 StateNotifier
class SeatNotifier extends StateNotifier<SeatState> {
  SeatNotifier() : super(SeatState(List.generate(20, (_) => List.generate(4, (_) => false))));

  void toggleSeat(int row, int col) {
    final newSeats = List<List<bool>>.from(state.seats);
    newSeats[row][col] = !newSeats[row][col];
    state = state.copyWith(seats: newSeats);
  }
}

// 전역적으로 사용할 Provider
final seatProvider = StateNotifierProvider<SeatNotifier, SeatState>((ref) {
  return SeatNotifier();
});