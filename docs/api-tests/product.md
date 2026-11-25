# 상품 예외 테스트

| 번호 | 요청 | 상황 | 기대 status |
|---|---|---|---|
| E1 | `POST /api/products` | 필수 값(name) 누락 | 400 |
| E2 | `GET /api/products/{productId}` | 없는 상품 조회 | 404 |
| E3 | `GET /api/products?page=-1` | 잘못된 page 값 | 400 |
| E4 | `PATCH /api/products/{productId}` | 수정할 값이 하나도 없음 | 400 |
| E5 | `PATCH /api/products/{productId}` | 없는 상품 수정 | 404 |
| E6 | `DELETE /api/products/{productId}` | 없는 상품 삭제 | 404 |
| E7 | `POST /api/products` | name 이 100자 초과 | 400 |
| E8 | `POST /api/products` | name 이 빈 문자열 | 400 |
| E9 | `POST /api/products` | price 가 음수 | 400 |

## E1. 필수 값(name) 누락
요청: `POST /api/products`

준비: 없음

요청
```json
{
  "price": 35000
}
```

응답 `400`
```json
{
  "status": 400,
  "message": "요청 값이 올바르지 않습니다."
}
```

## E2. 없는 상품 조회
요청: `GET /api/products/999`

준비: 상품 999 가 없음

요청
```json
{}
```

응답 `404`
```json
{
  "status": 404,
  "message": "상품을 찾을 수 없습니다."
}
```

## E3. 잘못된 page 값
요청: `GET /api/products?page=-1`

준비: 없음

요청
```json
{}
```

응답 `400`
```json
{
  "status": 400,
  "message": "요청 값이 올바르지 않습니다."
}
```

## E4. 수정할 값이 하나도 없음
요청: `PATCH /api/products/1`

준비: 상품 1 이 있음

요청
```json
{}
```

응답 `400`
```json
{
  "status": 400,
  "message": "요청 값이 올바르지 않습니다."
}
```

## E5. 없는 상품 수정
요청: `PATCH /api/products/999`

준비: 상품 999 가 없음

요청
```json
{
  "price": 39000
}
```

응답 `404`
```json
{
  "status": 404,
  "message": "상품을 찾을 수 없습니다."
}
```

## E6. 없는 상품 삭제
요청: `DELETE /api/products/999`

준비: 상품 999 가 없음

요청
```json
{}
```

응답 `404`
```json
{
  "status": 404,
  "message": "상품을 찾을 수 없습니다."
}
```

## E7. name 이 100자 초과
요청: `POST /api/products`

준비: 없음

요청
```json
{
  "name": "가(101자 문자열)",
  "price": 35000
}
```

응답 `400`
```json
{
  "status": 400,
  "message": "요청 값이 올바르지 않습니다."
}
```

## E8. name 이 빈 문자열
요청: `POST /api/products`

준비: 없음

요청
```json
{
  "name": "",
  "price": 35000
}
```

응답 `400`
```json
{
  "status": 400,
  "message": "요청 값이 올바르지 않습니다."
}
```

## E9. price 가 음수
요청: `POST /api/products`

준비: 없음

요청
```json
{
  "name": "무선 키보드",
  "price": -1
}
```

응답 `400`
```json
{
  "status": 400,
  "message": "요청 값이 올바르지 않습니다."
}
```
