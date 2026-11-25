# 상품 결정 목록

docs/ 와 AGENTS.md 에 상품 요구사항이 없어 아래 항목은 추천값을 명세에 먼저 반영했다.
번호는 signup 결정 목록(D1~D9)과 겹치지 않도록 D10 부터 시작한다 (`docs/db/schema.md` 가 한 파일이라 번호가 겹치면 구분이 안 된다).

## 결정할 것
| 번호 | 무엇을 정할까요? | 선택지 | 추천 | 결정 |
|---|---|---|---|---|
| D13 | 가격 타입과 범위는? | 0 이상 정수(원) / 1 이상 정수 / 소수 허용 | 0 이상 정수(원) | |
| D14 | 상품명 중복을 허용하나? | 허용 / 불가(409) | 허용 | |
| D15 | 등록·수정·삭제에 로그인/권한이 필요한가? (등록자 회원 연결 포함) | 불필요 / 로그인 필요 / 관리자만 | 불필요 (현재 인증 요구사항 없음) | |
| D16 | 삭제 방식은? | 물리 삭제 / 논리 삭제(삭제 플래그) | 물리 삭제 | |
| D17 | 수정 방식은? | PATCH 부분 수정 / PUT 전체 교체 | PATCH 부분 수정 (보낸 필드만 변경, 최소 1개 필수) | |
| D18 | 목록 조회의 페이징·정렬 기본값과 응답 형태는? | page=0,size=20,sort=createdAt,desc + content/page 정보 / 페이징 없이 전체 | page=0, size=20, sort=createdAt,desc, 응답은 content·page·size·totalElements·totalPages | |
| D19 | 요청 값 오류(400) 메시지를 필드별로 구분하나? | 하나의 공통 메시지 / 필드별 메시지 | 하나의 공통 메시지 | |
| D20 | 등록·수정 성공 응답에 담을 값은? | 상품 전체 필드 / id만 | 상품 전체 필드 (id, name, price, description, stock, category, createdAt, updatedAt) | |
| D21 | description·stock·category 의 필수 여부·길이·범위는? (D11 에서 필드만 정해짐) | description 선택 1000자 이하, stock 선택(기본 0)·0 이상 정수, category 선택 50자 이하 / 모두 필수 / 그 외 | description 선택 1000자 이하, stock 선택(기본 0)·0 이상 정수, category 선택 50자 이하 | |

## 결정 완료
| 번호 | 결정 | 반영 커밋 |
|---|---|---|
| D10 | 상품 API 범위: 등록·단건조회·목록조회·수정·삭제 5개 (PR 코멘트 D10) | docs: product 결정 반영 |
| D11 | 상품 필드: name, price, description, stock, category (PR 코멘트 D11, 작성자 euneuneun) | docs: product 결정 반영 |
| D12 | 상품명 길이: 최소 1자 ~ 최대 100자 (PR 코멘트 D12) | docs: product 결정 반영 |
