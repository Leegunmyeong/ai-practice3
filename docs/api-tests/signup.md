# 회원가입 예외 테스트
- 요청: `POST /api/members`

| 번호 | 상황 | 기대 status |
|---|---|---|
| E1 | 필수 값(email) 누락 | 400 |
| E2 | 이미 가입된 이메일 | 409 |
| E3 | 이미 사용 중인 닉네임 | 409 |

## E1. 필수 값(email) 누락
준비: 없음

요청
```json
{
  "password": "abcd1234",
  "nickname": "gygim"
}
```

응답 `400`
```json
{
  "status": 400,
  "message": "요청 값이 올바르지 않습니다."
}
```

## E2. 이미 가입된 이메일
준비: 같은 이메일로 먼저 가입

요청
```json
{
  "email": "user@example.com",
  "password": "abcd1234",
  "nickname": "gygim"
}
```

응답 `409`
```json
{
  "status": 409,
  "message": "이미 사용 중인 이메일입니다."
}
```

## E3. 이미 사용 중인 닉네임
준비: 같은 닉네임으로 먼저 가입

요청
```json
{
  "email": "other@example.com",
  "password": "abcd1234",
  "nickname": "gygim"
}
```

응답 `409`
```json
{
  "status": 409,
  "message": "이미 사용 중인 닉네임입니다."
}
```
