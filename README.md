# GourmetLog
Project for Intelligent Web Design

**Tree**
GourmetLog/
├── src/
│   └── main/java/
│       ├── dao/
│       │   └── RestaurantRepository.java  (DB 연동 CRUD 담당)
│       ├── dto/
│       │   └── Restaurant.java            (데이터 객체 - 금액, 위치, 메모 포함)
│       └── util/
│           └── DatabaseUtil.java          (DB 연결 헬퍼 클래스)
├── src/
│   └── main/resources/
│       ├── message_ko.properties          (다국어 - 한국어)
│       └── message_en.properties          (다국어 - 영어)
├── WebContent/ (또는 src/main/webapp/)
│   ├── resources/
│   │   ├── css/
│   │   ├── images/                        (업로드된 이미지 저장소)
│   │   └── js/
│   │       └── validation.js              (유효성 검사)
│   ├── WEB-INF/
│   │   └── lib/                           (mysql-connector, cos.jar, jstl.jar 필요)
│   ├── menu.jsp                           (상단 메뉴 - 세션 로그인 체크)
│   ├── footer.jsp
│   ├── restaurants.jsp                    (맛집 목록)
│   ├── restaurant.jsp                     (상세 보기 - 쿠키 생성)
│   ├── addRestaurant.jsp                  (등록 폼 - 다국어 적용)
│   ├── processAddRestaurant.jsp           (파일 업로드 및 DB 저장 처리)
│   └── deleteRestaurant.jsp               (삭제 처리)
