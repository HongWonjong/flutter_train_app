<개요>
Flutter와 Riverpod를 사용하여 개발된 기차 예매 애플리케이션입니다.
사용자는 출발역과 도착역을 선택한 후, 원하는 좌석을 지정한 뒤 예매를 완료할 수 있습니다. 또한, 다크 모드와 라이트 모드 간 전환 기능을 지원합니다.

<주요 기능>
출발역 및 도착역 선택: 사용자는 StationListPage에서 출발역과 도착역을 선택할 수 있다.
좌석 선택: SeatPage에서 20행 4열의 좌석 중 하나를 선택할 수 있다.
예매 확인: 선택한 좌석을 기반으로 예매를 완료하며, 완료 시 알림이 표시됨.
테마 전환: CustomAppBar에서 다크 모드와 라이트 모드를 아이콘을 클릭함으로써 전환 가능.

<파일 설명>
homepage.dart: 출발역과 도착역 선택 UI를 제공하며, 좌석 선택 페이지로 이동하는 버튼을 포함.
seat_page.dart: 좌석 배치도를 표시하고, 사용자가 좌석을 선택할 수 있도록 함.
station_list_page.dart: 역 목록을 표시하고, 출발역 또는 도착역을 설정.
custom_app_bar.dart: 테마 전환 버튼이 포함된 앱바 컴포넌트.
style.dart: 앱 전반에 걸친 스타일(색상, 텍스트 스타일, 데코레이션 등)을 정의.
seat_provider.dart: 좌석의 선택 상태를 관리.
station_provider.dart: 출발역과 도착역 상태를 관리.
theme_provider.dart: 테마 모드(다크/라이트)를 관리합.