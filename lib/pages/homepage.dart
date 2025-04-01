import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/station_provider.dart';
import 'station_list_page.dart';
import 'seat_page.dart';
import 'package:flutter_train_app/components/custom_app_bar.dart';
import '../style/style.dart';



class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stationState = ref.watch(stationProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: '기차 예매'),
      body: Container(
        padding: kDefaultPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              decoration: kStationContainerDecoration,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: kLeftPadding20,
                          child: Text(
                            '출발역',
                            style: kStationLabelStyle,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: kLeftPadding20,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const StationListPage(isDeparture: true),
                                ),
                              );
                            },
                            child: Text(
                              stationState.departureStation ?? '선택',
                              style: kStationNameStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 2,
                    height: 50,
                    color: kDividerMediumColor,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: kRightPadding20,
                          child: Text(
                            '도착역',
                            style: kStationLabelStyle,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: kRightPadding20,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const StationListPage(isDeparture: false),
                                ),
                              );
                            },
                            child: Text(
                              stationState.arrivalStation ?? '선택',
                              style: kStationNameStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SeatPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: Colors.white,
                  shape: kButtonShape,
                ),
                child: const Text(
                  '좌석 선택',
                  style: kButtonTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}