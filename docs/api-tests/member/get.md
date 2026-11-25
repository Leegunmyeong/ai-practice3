# 회원 단건 조회 예외 테스트
- 요청: `GET /api/members/{memberId}`

| 번호 | 상황 | 기대 status |
|---|---|---|
| E1 | memberId 가 Long 형식이 아님 | 400 |
| E2 | 존재하지 않는 회원 | 404 |

## E1. memberId 가 Long 형식이 아님
준비: 없음

요청: `GET /api/members/abc` (body 없음)

응답 `400`
```json
{
  "status": 400,
  "message": "요청 값이 올바르지 않습니다."
}
```

## E2. 존재하지 않는 회원
준비: memberId 999 인 회원이 없는 상태

요청: `GET /api/members/999` (body 없음)

응답 `404`
```json
{
  "status": 404,
  "message": "회원을 찾을 수 없습니다."
}
```
