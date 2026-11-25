# 상품 목록 조회

domain: product

url: /api/products

method: GET

success: `200 OK`

# 01. 설명

상품 목록을 페이지 단위로 조회할 때 사용한다.

- 필수: 없음
- 선택: page, size, sort
- 기본값과 응답 형태 결정 필요 D18
- 공통: 로그인·권한 필요 여부 결정 필요 D15, 400 메시지 구분 결정 필요 D19.

# 02. 요청(Request)

## a. Parameter & Querystring

```txt
/api/products?page={page}&size={size}&sort={sort}
/api/products?page=0&size=20&sort=createdAt,desc
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| page | Integer | N | 페이지 번호(0부터). 기본값 0. 결정 필요 D18 |
| size | Integer | N | 페이지 크기. 기본값 20. 결정 필요 D18 |
| sort | String | N | `<필드>,<asc\|desc>`. 기본값 `createdAt,desc`. 정렬 가능 필드는 id, name, price, createdAt. 결정 필요 D18 |

## b. request headers

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| 없음 | | | |

## c. request body

없음

# 03. 응답(Response)

## a. response header

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| Content-Type | String | Y | `application/json` |

## b. response body

**성공 응답:** `200 OK`

```json
{
  "content": [
    {
      "id": 1,
      "name": "키보드",
      "price": 35000,
      "description": "기계식 키보드",
      "stock": 10,
      "category": "컴퓨터 주변기기",
      "createdAt": "2026-11-25T10:00:00",
      "updatedAt": "2026-11-25T10:00:00"
    }
  ],
  "page": 0,
  "size": 20,
  "totalElements": 1,
  "totalPages": 1
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| content | Array | Y | 상품 목록. 없으면 빈 배열 |
| content[].id | Long | Y | 상품 식별자 |
| content[].name | String | Y | 상품명 |
| content[].price | Long | Y | 가격(원) |
| content[].description | String | N | 상품 설명. 없으면 null |
| content[].stock | Integer | Y | 재고 수량 |
| content[].category | String | N | 카테고리. 없으면 null |
| content[].createdAt | String | Y | 등록 일시 |
| content[].updatedAt | String | Y | 수정 일시 |
| page | Integer | Y | 현재 페이지 번호 |
| size | Integer | Y | 페이지 크기 |
| totalElements | Long | Y | 전체 상품 수 |
| totalPages | Integer | Y | 전체 페이지 수 |

**에러 응답:** `400 Bad Request` — page, size, sort 값이 올바르지 않을 때

```json
{
  "status": 400,
  "message": "요청 값이 올바르지 않습니다."
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| status | Integer | Y | HTTP 상태 코드 |
| message | String | Y | 에러 메시지 |
