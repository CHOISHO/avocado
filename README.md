# avocado

우산 챙김 알림 서비스, 비오니
- 출근 전, 외출 전에 우산을 챙길지 말지를 알고 싶었던 니즈가 있었음
- 데이트 나가면서 꼭 우산 안 챙겨서 구매 했던 우산이 엄청 많음
- 더 이상 우산을 추가 구매 하고 싶지 않았음
- 원하는 시간에 푸쉬알림을 받고 싶음

<b>Flutter, Firebase</b> 서버리스 앱 서비스 개발로 진행

## screenshot
<div>
  <img src="https://github.com/CHOISHO/avocado/blob/master/assets/images/splash.jpg" width="200"/>
  <img src="https://github.com/CHOISHO/avocado/blob/master/assets/images/home.jpg" width="200"/>
  <img src="https://github.com/CHOISHO/avocado/blob/master/assets/images/push.jpg" width="200"/>
  <img src="https://github.com/CHOISHO/avocado/blob/master/assets/images/push_detail.jpg" width="200"/>  
</div>

## TODO
- [x] 날씨 정보 불러오기 기능 
  - [x] 위치 정보 기반의 날씨 조회 API
    [기상청_단기예보 ((구)_동네예보) 조회서비스](https://www.data.go.kr/data/15084084/openapi.do)
  - [x] 주소 정보 기반 위치 정보(longditude, langditude) 패키지
    [geocoding](https://pub.dev/packages/geocoding)
- [ ] 알림 기능
  - [x] 개인별 알림 데이터가 필요하니 유저 정보를 저장해야 할 듯(Firestore Database)
  - [ ] 푸시 노티피케이션 상황별 리스너 설정
  - [ ] 설정된 알림에 따라 개인별 알림을 보내주기 위한 스케쥴링 함수(Firebase Functions CronJob)
