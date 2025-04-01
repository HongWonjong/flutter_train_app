import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/station_provider.dart';
import '../provider/seat_provider.dart';
import 'package:flutter_train_app/components/custom_app_bar.dart';
import '../style/style.dart';

///
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
            padding: kVerticalPadding20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  stationState.departureStation ?? '출발역',
                  style: kSelectedStationStyle,
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_circle_right_outlined,
                  size: kIconSize,
                ),
                const SizedBox(width: 10),
                Text(
                  stationState.arrivalStation ?? '도착역',
                  style: kSelectedStationStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: kVerticalPadding10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: kLegendSelectedDecoration,
                ),
                const SizedBox(width: 8),
                const Text('선택됨'),
                const SizedBox(width: 20),
                Container(
                  width: 24,
                  height: 24,
                  decoration: kLegendUnselectedDecoration,
                ),
                const SizedBox(width: 8),
                const Text('선택안됨'),
              ],
            ),
          ),
          Padding(
            padding: kHorizontalPadding20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: kSeatSize.width, height: kSeatSize.height, alignment: Alignment.center, child: const Text('A', style: kSeatLabelStyle)),
                const SizedBox(width: 2),
                Container(width: kSeatSize.width, height: kSeatSize.height, alignment: Alignment.center, child: const Text('B', style: kSeatLabelStyle)),
                const SizedBox(width: 40),
                Container(width: kSeatSize.width, height: kSeatSize.height, alignment: Alignment.center, child: const Text('C', style: kSeatLabelStyle)),
                const SizedBox(width: 2),
                Container(width: kSeatSize.width, height: kSeatSize.height, alignment: Alignment.center, child: const Text('D', style: kSeatLabelStyle)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: kVerticalPadding20,
              itemCount: 20,
              itemBuilder: (context, rowIndex) {
                return Padding(
                  padding: kCustomPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          ref.read(seatProvider.notifier).toggleSeat(rowIndex, 0);
                        },
                        child: Container(
                          width: kSeatSize.width,
                          height: kSeatSize.height,
                          decoration: kSeatDecoration(seatState.seats[rowIndex][0]),
                        ),
                      ),
                      const SizedBox(width: 2),
                      GestureDetector(
                        onTap: () {
                          ref.read(seatProvider.notifier).toggleSeat(rowIndex, 1);
                        },
                        child: Container(
                          width: kSeatSize.width,
                          height: kSeatSize.height,
                          decoration: kSeatDecoration(seatState.seats[rowIndex][1]),
                        ),
                      ),
                      const SizedBox(width: 2),
                      Container(
                        width: kSeatSize.width,
                        height: kSeatSize.height,
                        alignment: Alignment.center,
                        child: Text(
                          '${rowIndex + 1}',
                          style: kSeatLabelStyle,
                        ),
                      ),
                      const SizedBox(width: 2),
                      GestureDetector(
                        onTap: () {
                          ref.read(seatProvider.notifier).toggleSeat(rowIndex, 2);
                        },
                        child: Container(
                          width: kSeatSize.width,
                          height: kSeatSize.height,
                          decoration: kSeatDecoration(seatState.seats[rowIndex][2]),
                        ),
                      ),
                      const SizedBox(width: 2),
                      GestureDetector(
                        onTap: () {
                          ref.read(seatProvider.notifier).toggleSeat(rowIndex, 3);
                        },
                        child: Container(
                          width: kSeatSize.width,
                          height: kSeatSize.height,
                          decoration: kSeatDecoration(seatState.seats[rowIndex][3]),
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
              padding: kSymmetricPadding20_10,
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
                            color: kDividerLightColor,
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
                                    style: kCancelButtonStyle,
                                  ),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 48,
                                color: kDividerLightColor,
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
                                    style: kConfirmButtonStyle,
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
                    backgroundColor: kPrimaryColor,
                    foregroundColor: Colors.white,
                    shape: kButtonShape
                  ),
                  child: const Text(
                    '예매하기',
                    style: kButtonTextStyle,
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