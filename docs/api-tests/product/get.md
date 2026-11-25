# 상품 단건 조회 예외 테스트
- 요청: `GET /api/products/{productId}`

| 번호 | 상황 | 기대 status |
|---|---|---|
| E1 | 없는 상품 조회 | 404 |

## E1. 없는 상품 조회
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
