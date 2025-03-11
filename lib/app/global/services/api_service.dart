import 'dart:async';

class ApiService {
  // Simulated GET request
  Future<Map<String, dynamic>> get(String endpoint,
      {Map<String, dynamic>? params}) async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

    // Simulated responses
    if (endpoint == "/products?page=1") {
      return {
        "status": "success",
        "data": [
          {
            "id": 1,
            "title": "Sony WH-1000XM3 Bluetooth Wireless Over Ear Headphones",
            "image":
                "https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1692947383286-714WUJlhbLS._SL1500_.jpg",
            "price": 773,
            "description":
                "Industry-leading ANC, Hi-Res Audio, Alexa enabled...",
            "brand": "Sony",
            "model": "WH-1000XM3",
            "color": "Silver",
            "category": "Audio",
            "discount": 11
          },
          {
            "id": 2,
            "title": "Microsoft Xbox X/S Wireless Controller Robot White",
            "image":
                "https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1692255251854-xbox.jpg",
            "price": 57,
            "description":
                "Modern design, textured grip, hybrid D-pad, customizable buttons...",
            "brand": "Microsoft",
            "model": "Xbox X/S",
            "color": "White",
            "category": "Gaming",
            "popular": true,
            "discount": 4
          },
          {
            "id": 3,
            "title": "Logitech G733 Lightspeed Wireless Gaming Headset",
            "image":
                "https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1692257709689-logitech heaphone.jpg",
            "price": 384,
            "description":
                "LIGHTSYNC RGB, 20m wireless range, Blue VO!CE mic, 29-hour battery...",
            "brand": "Logitech G",
            "model": "G733 LIGHTSPEED",
            "color": "White",
            "category": "Gaming",
            "popular": true,
            "discount": 3
          },
          {
            "id": 4,
            "title": "Sony WH-1000XM5 Wireless ANC Headphones",
            "image":
                "https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1692941008275-headphone3.jpg",
            "price": 362,
            "description":
                "8-mic noise canceling, AI-based voice pickup, 30-hour battery...",
            "brand": "Sony",
            "model": "WH1000XM5",
            "color": "White",
            "category": "Audio",
            "popular": true,
            "discount": 11
          },
          {
            "id": 5,
            "title": "Urbanista Los Angeles Solar-Powered Headphones",
            "image":
                "https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1691056487173-headphon2.jpg",
            "price": 265,
            "description":
                "World’s 1st solar-charging ANC headphones, unlimited playtime...",
            "brand": "Urbanista",
            "model": "Los Angeles",
            "color": "Sand Gold",
            "category": "Audio",
            "popular": true,
            "discount": 19
          },
          {
            "id": 6,
            "title": "Xiaomi Wired In-Ear Earphones with Mic",
            "image":
                "https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1691057474498-earphone.jpg",
            "price": 5,
            "description":
                "10mm drivers, deep bass, L-shaped jack, ergonomic fit...",
            "brand": "Xiaomi",
            "model": "Mi Earphones Basic Blue",
            "color": "Blue",
            "category": "Audio"
          },
          {
            "id": 7,
            "title": "boAt Rockerz 370 Bluetooth Headphones",
            "image":
                "https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1691057718636-headphone5.jpg",
            "price": 12,
            "description":
                "12-hour playtime, Bluetooth v5.0, padded earcups, dual-mode...",
            "brand": "boAt",
            "model": "Rockerz 370",
            "color": "Black",
            "category": "Audio"
          },
          {
            "id": 8,
            "title": "Samsung Galaxy S21 FE 5G (Lavender, 128GB)",
            "image":
            "https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1691074519203-galaxy S22 5G.jpg",
            "price": 434,
            "description":
                "Pro-grade camera, 30X Space Zoom, 120Hz AMOLED display...",
            "brand": "Samsung",
            "model": "Galaxy S21 FE 5G",
            "color": "Lavender",
            "category": "Mobile",
            "discount": 9,
            "onSale": true
          },
          {
            "id": 9,
            "title": "Amkette EvoFox Elite Ops Wireless Gamepad",
            "image":
                "https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1694100438525-51Prg4Smx-L._SL1500_.jpg",
            "price": 18,
            "description":
                "Zero lag connectivity, dual vibration, 8-hour battery...",
            "brand": "Amkette",
            "model": "Woburn II Bluetooth",
            "color": "Gray",
            "category": "Gaming",
            "discount": 3
          },
          {
            "id": 10,
            "title": "Samsung Galaxy S22 5G (Phantom White, 128GB)",
            "image":
                "https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1691074519203-galaxy S22 5G.jpg",
            "price": 760,
            "description":
                "Nightography camera, 120Hz AMOLED, Gorilla Glass Victus+...",
            "brand": "Samsung",
            "model": "Galaxy S22 5G",
            "color": "White",
            "category": "Mobile",
            "discount": 29
          }
        ]
      };
    }else if (endpoint == "/products?page=2") {
      return {
        "status": "success",
        "data": [
          {
            "id": 6,
            "title": "Xiaomi Wired In-Ear Earphones with Mic",
            "image":
            "https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1691057474498-earphone.jpg",
            "price": 5,
            "description":
            "10mm drivers, deep bass, L-shaped jack, ergonomic fit...",
            "brand": "Xiaomi",
            "model": "Mi Earphones Basic Blue",
            "color": "Blue",
            "category": "Audio"
          },
          {
            "id": 7,
            "title": "boAt Rockerz 370 Bluetooth Headphones",
            "image":
            "https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1691057718636-headphone5.jpg",
            "price": 12,
            "description":
            "12-hour playtime, Bluetooth v5.0, padded earcups, dual-mode...",
            "brand": "boAt",
            "model": "Rockerz 370",
            "color": "Black",
            "category": "Audio"
          },
          {
            "id": 8,
            "title": "Samsung Galaxy S21 FE 5G (Lavender, 128GB)",
            "image":
            "https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1691073671025-galaxy S21 FE.jpg",
            "price": 434,
            "description":
            "Pro-grade camera, 30X Space Zoom, 120Hz AMOLED display...",
            "brand": "Samsung",
            "model": "Galaxy S21 FE 5G",
            "color": "Lavender",
            "category": "Mobile",
            "discount": 9,
            "onSale": true
          },
          {
            "id": 9,
            "title": "Amkette EvoFox Elite Ops Wireless Gamepad",
            "image":
            "https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1694100438525-51Prg4Smx-L._SL1500_.jpg",
            "price": 18,
            "description":
            "Zero lag connectivity, dual vibration, 8-hour battery...",
            "brand": "Amkette",
            "model": "Woburn II Bluetooth",
            "color": "Gray",
            "category": "Gaming",
            "discount": 3
          },
          {
            "id": 10,
            "title": "Samsung Galaxy S22 5G (Phantom White, 128GB)",
            "image":
            "https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1691074519203-galaxy S22 5G.jpg",
            "price": 760,
            "description":
            "Nightography camera, 120Hz AMOLED, Gorilla Glass Victus+...",
            "brand": "Samsung",
            "model": "Galaxy S22 5G",
            "color": "White",
            "category": "Mobile",
            "discount": 29
          }
        ]
      };
    } else if (endpoint == "/cart") {
      return {
        "status": "success",
        "data": [
          {
            "id": 1,
            "title": "Sony WH-1000XM3 Bluetooth Wireless Over Ear Headphones",
            "image":
                "https://storage.googleapis.com/fir-auth-1c3bc.appspot.com/1692947383286-714WUJlhbLS._SL1500_.jpg",
            "price": 773,
            "description":
                "Industry-leading ANC, Hi-Res Audio, Alexa enabled...",
            "brand": "Sony",
            "model": "WH-1000XM3",
            "color": "Silver",
            "category": "Audio",
            "discount": 11
          },
        ]
      };
    }

    return {"status": "error", "message": "Invalid endpoint"};
  }

  // Simulated POST request
  Future<Map<String, dynamic>> post(String endpoint,
      {Map<String, dynamic>? data}) async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

    if (endpoint == "/cart/add") {
      return {"status": "success", "message": "Product added to cart"};
    } else if (endpoint == "/wishlist/add") {
      return {"status": "success", "message": "Product added to wishlist"};
    }

    return {"status": "error", "message": "Invalid request"};
  }
}
