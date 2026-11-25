# 장바구니 조회

domain: cart

url: /api/carts/{memberId}/items

method: GET

success: `200 OK`

# 01. 설명

회원이 자신의 장바구니에 담긴 항목 전체를 조회할 때 사용한다. 결정 번호는 `docs/decisions/cart.md` 기준이다.

- 필수: memberId
- 선택: 없음
- 장바구니 API 범위 결정 필요 D1, 장바구니 소유자 식별 방식 결정 필요 D2, 응답 내용 결정 필요 D7, 페이징·정렬 결정 필요 D8
- 회원이 없으면 `404 Not Found` 를 반환한다. 담긴 항목이 없으면 빈 배열을 반환한다.
- 공통: 로그인·권한 필요 여부는 member D3, product D15 와 같다 (새로 정하지 않음). 400 메시지 구분은 product D19, member D6 과 같다 (새로 정하지 않음).

# 02. 요청(Request)

## a. Parameter & Querystring

```txt
/api/carts/{memberId}/items
/api/carts/1/items
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| memberId | Long | Y | 장바구니 소유 회원 식별자. 소유자 식별 방식 결정 필요 D2 |

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
  "items": [
    {
      "id": 1,
      "productId": 1,
      "productName": "키보드",
      "price": 35000,
      "quantity": 2,
      "createdAt": "2026-11-25T10:00:00",
      "updatedAt": "2026-11-25T10:00:00"
    }
  ]
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| items | Array | Y | 장바구니 항목 목록. 없으면 빈 배열. 담은 순서(id 오름차순). 페이징·정렬 결정 필요 D8 |
| items[].id | Long | Y | 장바구니 항목 식별자 |
| items[].productId | Long | Y | 상품 식별자 |
| items[].productName | String | Y | 상품명. 응답 내용 결정 필요 D7 |
| items[].price | Long | Y | 상품의 현재 가격(원). 응답 내용 결정 필요 D7 |
| items[].quantity | Integer | Y | 담긴 수량 |
| items[].createdAt | String | Y | 항목이 처음 담긴 일시 |
| items[].updatedAt | String | Y | 항목 수정 일시 |

**에러 응답:** `400 Bad Request` — memberId 가 Long 형식이 아닐 때

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

**에러 응답:** `404 Not Found` — 회원이 없을 때

```json
{
  "status": 404,
  "message": "회원을 찾을 수 없습니다."
}
```

| 이름 | 데이터타입 | 필수 | 설명 |
|---|---|---|---|
| status | Integer | Y | HTTP 상태 코드 |
| message | String | Y | 에러 메시지 |
