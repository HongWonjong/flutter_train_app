import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/custom_app_bar.dart';
import '../provider/station_provider.dart';

class StationListPage extends ConsumerWidget {
  final bool isDeparture;

  const StationListPage({super.key, required this.isDeparture});

  final List<String> stations = const [
    '수서',
    '동탄',
    '평택지제',
    '천안아산',
    '오송',
    '대전',
    '김천구미',
    '동대구',
    '경주',
    '울산',
    '부산',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stationState = ref.watch(stationProvider);

    return Scaffold(
      appBar: CustomAppBar(title: isDeparture ? '출발역 선택' : '도착역 선택'),
      body: ListView.builder(
        itemCount: stations.length,
        itemBuilder: (context, index) {
          final isDisabled = (isDeparture && stationState.arrivalStation == stations[index]) ||
              (!isDeparture && stationState.departureStation == stations[index]);

          return Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            child: ListTile(
              title: Text(
                stations[index],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: isDisabled
                  ? Text(
                isDeparture ? '이 역은 도착역입니다' : '이 역은 출발역입니다',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              )
                  : null,
              enabled: !isDisabled,
              onTap: () {
                if (isDeparture) {
                  ref.read(stationProvider.notifier).setDepartureStation(stations[index]);
                } else {
                  ref.read(stationProvider.notifier).setArrivalStation(stations[index]);
                }
                Navigator.pop(context);
              },
            ),
          );
        },
      ),
    );
  }
}