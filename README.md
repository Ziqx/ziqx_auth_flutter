# Ziqx Auth
Simple and minimal authentication package for [Ziqx](https://ziqx.in) Auth.

You can use this package to authenticate users in your application.
You must get the API key and get your app registered with Ziqx Ecosystem to use this package.

### Usage
```dart
import 'package:ziqx_auth/ziqx_auth.dart';

ZiqxAuth.authenticate(
    context: context,
    api: API_KEY,
    app: APP_NAME,
    onSuccess: (res) {
        // Do something with the response
    }

);
// Once the user is authenticated, you can get the user details as response.
```

### Response
```dart
{
    "status": "success", 
    "message": "Session created successfully", 
    "data": 
        {
            "app": "ziqx", 
            "createdAt": 1668996733300, 
            "isVerified": true, 
            "userId":uid,
            "key": "p66dx5lq3yar"
        }
}
```

That's All

Ziqx is meant for simplicity and ease of use. We are trying to make it as simple as possible. We are open to suggestions and contributions. Feel free to open an issue or a pull request.