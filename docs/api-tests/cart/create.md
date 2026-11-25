# 장바구니 담기 예외 테스트
- 요청: `POST /api/carts/{memberId}/items`

| 번호 | 상황 | 기대 status |
|---|---|---|
| E1 | 필수 값(productId) 누락 | 400 |
| E2 | quantity 가 0 | 400 |
| E3 | 없는 회원 | 404 |
| E4 | 없는 상품 | 404 |

## E1. 필수 값(productId) 누락
요청: `POST /api/carts/1/items`

준비: 회원 1 이 있음

요청
```json
{
  "quantity": 2
}
```

응답 `400`
```json
{
  "status": 400,
  "message": "요청 값이 올바르지 않습니다."
}
```

## E2. quantity 가 0
요청: `POST /api/carts/1/items`

준비: 회원 1, 상품 1 이 있음

요청
```json
{
  "productId": 1,
  "quantity": 0
}
```

응답 `400`
```json
{
  "status": 400,
  "message": "요청 값이 올바르지 않습니다."
}
```

## E3. 없는 회원
요청: `POST /api/carts/999/items`

준비: 회원 999 가 없음, 상품 1 이 있음

요청
```json
{
  "productId": 1,
  "quantity": 2
}
```

응답 `404`
```json
{
  "status": 404,
  "message": "회원을 찾을 수 없습니다."
}
```

## E4. 없는 상품
요청: `POST /api/carts/1/items`

준비: 회원 1 이 있음, 상품 999 가 없음

요청
```json
{
  "productId": 999,
  "quantity": 2
}
```

응답 `404`
```json
{
  "status": 404,
  "message": "상품을 찾을 수 없습니다."
}
```
