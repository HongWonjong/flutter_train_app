import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/station_provider.dart';
import '../provider/seat_provider.dart';
import 'package:flutter_train_app/components/custom_app_bar.dart';
class SeatPage extends ConsumerWidget {
  const SeatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stationState = ref.watch(stationProvider);
    final seatState = ref.watch(seatProvider);

    String? getSelectedSeat() {
      for (int row = 0; row < seatState.seats.length; row++) {
        for (int col = 0; col < seatState.seats[row].length; col++) {
          if (seatState.seats[row][col]) {
            String seatLabel = String.fromCharCode(65 + col);
            return '${row + 1}-$seatLabel';
          }
        }
      }
      return null;
    }

    return Scaffold(
      appBar: const CustomAppBar(title: '좌석 선택'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  stationState.departureStation ?? '출발역',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 30,
                ),
                const SizedBox(width: 10),
                Text(
                  stationState.arrivalStation ?? '도착역',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 8),
                const Text('선택됨'),
                const SizedBox(width: 20),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 8),
                const Text('선택안됨'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 40, height: 40, alignment: Alignment.center, child: const Text('A', style: TextStyle(fontSize: 16))),
                const SizedBox(width: 2),
                Container(width: 40, height: 40, alignment: Alignment.center, child: const Text('B', style: TextStyle(fontSize: 16))),
                const SizedBox(width: 2),
                const SizedBox(width: 40),
                Container(width: 40, height: 40, alignment: Alignment.center, child: const Text('C', style: TextStyle(fontSize: 16))),
                const SizedBox(width: 2),
                Container(width: 40, height: 40, alignment: Alignment.center, child: const Text('D', style: TextStyle(fontSize: 16))),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemCount: 20,
              itemBuilder: (context, rowIndex) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          ref.read(seatProvider.notifier).toggleSeat(rowIndex, 0);
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: seatState.seats[rowIndex][0] ? Colors.purple : Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(width: 2),
                      GestureDetector(
                        onTap: () {
                          ref.read(seatProvider.notifier).toggleSeat(rowIndex, 1);
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: seatState.seats[rowIndex][1] ? Colors.purple : Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(width: 2),
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          '${rowIndex + 1}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 2),
                      GestureDetector(
                        onTap: () {
                          ref.read(seatProvider.notifier).toggleSeat(rowIndex, 2);
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: seatState.seats[rowIndex][2] ? Colors.purple : Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(width: 2),
                      GestureDetector(
                        onTap: () {
                          ref.read(seatProvider.notifier).toggleSeat(rowIndex, 3);
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: seatState.seats[rowIndex][3] ? Colors.purple : Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final selectedSeat = getSelectedSeat();
                    if (selectedSeat == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('좌석을 선택해주세요.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }

                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('예매 하시겠습니까?'),
                        content: Text('좌석: $selectedSeat'),
                        actions: [
                          Divider(
                            color: Colors.grey[300],
                            height: 1,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    '취소',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 48,
                                color: Colors.grey[300],
                              ),
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('예매가 완료되었습니다.'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    '확인',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    '예매하기',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}