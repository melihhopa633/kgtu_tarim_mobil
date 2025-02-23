# User Authentication API Documentation

## Register

### Endpoint
**POST**  
`https://kgtutarim-cygzhnewd6djaxfz.polandcentral-01.azurewebsites.net/api/v1/Users`

### Request Body
```json
{
  "userName": "dummyUser",
  "email": "dummy.user@example.com",
  "phoneNumber": "+1-555-000-0000",
  "password": "DummyPass123!",
  "firstName": "Dummy",
  "lastName": "User",
  "citizenId": "10000000146",
  "birthDate": "1980-01-01T00:00:00",
  "birthPlace": "Istanbul",
  "fullAddress": "123 Dummy Street, Istanbul, Turkey"
}
```

### Response
```json
{
    "isSuccess": true,
    "data": "User registered successfully!",
    "message": "Kayıt Başarılı",
    "statusCode": 201,
    "errors": null,
    "totalCount": 0
}
```

---

## Login

### Endpoint
**POST**  
`/api/v1/Users/Login`

### Request Body
```json
{
  "email": "dummy.user@example.com",
  "password": "DummyPass123!"
}
```

### Response
```json
{
    "isSuccess": true,
    "data": {
        "token": {
            "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjBjYmU4ZjE1LWZiMzItNDlmYi1hMTUwLWZhODlhNWZmZTA3OSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6ImR1bW15LnVzZXJAZXhhbXBsZS5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiZHVtbXlVc2VyIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiRmFybWVyIiwiZnVsbG5hbWUiOiJEdW1teSBVc2VyIiwibmJmIjoxNzQwMzE1NjM2LCJleHAiOjE3NDA0MDIwMzYsImlzcyI6ImxvY2FsaG9zdCIsImF1ZCI6ImxvY2FsaG9zdCJ9.b8L2VFF2Qm-pigXWWRmygGy59ZFl_uCKi2S2KUIrgtQ",
            "expireDate": "2025-02-24T13:00:36.4278104Z"
        },
        "refreshToken": "ZcCjUVaDE9zloaQ9y+KRXyikejRShU5Px44pHK9Ke7rVeXB/qumruSH9CLbgDydSbqGjqlrp8d4N+xoiV0HmFQ=="
    },
    "message": "Kullanıcı girişi başarılı",
    "statusCode": 200,
    "errors": null,
    "totalCount": 0
}
```

