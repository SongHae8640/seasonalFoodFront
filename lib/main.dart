import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '제철 음식 추천',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.notoSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: FoodRecommendationPage(),
    );
  }
}

class FoodRecommendationPage extends StatelessWidget {
  final List<Map<String, dynamic>> foods = [
    {'idx': 1, 'productName': '더덕', 'title': '산에서 나는 고기! <더덕>', 'content': '더덕은 섬유질이 풍부하고 씹히는 맛이 좋아서'},
    {'idx': 2, 'productName': '명태', 'title': '지방이 적고 단백질은 풍부한 <명태>', 'content': '이번 제철 농수산물은 다양한 이름을 갖고 있는 명태입니다'},
    {'idx': 3, 'productName': '홍합', 'title': '바다의 보약 <홍합> 편', 'content': '홍합은 대표적인 입동 음식으로 10월부터 2월까지 제철입니다. 하지만 홍합은 플랑크톤을 먹이로 하는 패류로, 봄철 섭취 시에 주의해야합니다.'},
    {'idx': 4, 'productName': '메밀', 'title': '찹쌀떡~ 메밀묵~ 올 겨울 최고의 다이어트 먹거리식품이 온다!!!!!! <메밀>', 'content': '메밀은 우리가 평소 요리 등 다양한 조리법을 통해 섭취하고 있지만 영양소까지는 정확히 알지 못하는 경우가 많은데 메밀에는 탄수화물, 단백질, 지질, 무기질, 비타민 B1, B2 및 필수 아미노산 등이 골고루 함유 된 영양소 집합체입니다.'},
    {'idx': 5, 'productName': '브로콜리', 'title': '겨울철 건강 지킴이, 항암의 끝판왕 <브로콜리>', 'content': '이번 주 제철 농수산물은 겨울철 건강 지킴이로 안성맞춤인 제철 채소 브로콜리입니다. 브로콜리 100g엔 비타민C가 98㎎이 들어있는데, 이는 비타민 식품의 대표주자인 레몬보다 2배가량 많은 양입니다.'},
    {'idx': 6, 'productName': '배추', 'title': '한국인의 밥상을 지키는 김치 주재료 <배추>', 'content': '서늘한 기후를 좋아하는 호냉성 채소지만 한국인의 밥상에 빠질 수 없는 김치 주재료로 봄, 여름, 가을, 겨울 1년 내내 출하되고 있습니다.'}
  ];

  void _showModalBottomSheet(BuildContext context, Map<String, dynamic> food) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(food['title'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(food['content']),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('제철 음식 추천'),
      ),
      body: ListView.builder(
        itemCount: foods.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(foods[index]['title']!),
              subtitle: Text(foods[index]['content']!),
              onTap: () => _showModalBottomSheet(context, foods[index]),
            ),
          );
        },
      ),
    );
  }
}
