# 상품 수정 예외 테스트
- 요청: `PATCH /api/products/{productId}`

| 번호 | 상황 | 기대 status |
|---|---|---|
| E1 | 수정할 값이 하나도 없음 | 400 |
| E2 | 없는 상품 수정 | 404 |

## E1. 수정할 값이 하나도 없음
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

## E2. 없는 상품 수정
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
