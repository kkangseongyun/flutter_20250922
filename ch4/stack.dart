import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() => runApp(MyApp());

//이벤트 내용 추상화 VO
class DataVO {
  String image;
  String title;
  String date;
  String content;
  String location;

  DataVO(this.image, this.title, this.date, this.content, this.location);
}

List<DataVO> datas = [
  DataVO('images/lab_lotte_1.jpg', '롯데웨딩위크', '각 지점 본 매장', '2.14(금) ~ 2.23(일)',
      '백화점 전점'),
  DataVO('images/lab_lotte_2.jpg', 'LG TROMM 스타일러', '각 지점 본 매장',
      '2.14(금) ~ 2.29(토)', '백화점 전점'),
  DataVO(
      'images/lab_lotte_3.jpg', '금양와인 페스티발', '본매장', '2.15(토) ~ 2.20(목)', '잠실점'),
  DataVO('images/lab_lotte_4.jpg', '써스데이 아일랜드', '본 매장', '2.17(월) ~ 2.23(일)',
      '잠실점'),
  DataVO('images/lab_lotte_5.jpg', '듀풍클래식', '본 매장', '2.21(금) ~ 3.8(일)', '잠실점'),
];

//이벤트 카드 하나를 위한 위젯...
class CardADWidget extends StatelessWidget {
  DataVO vo;
  CardADWidget(this.vo);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.pink,
        ),
        Align(
          alignment: Alignment(0.0, 0.0),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(vo.image, width: 350,),
                  Container(
                    width: 350,
                    height: 100,
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vo.title,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(vo.content),
                        Text(vo.date)
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                left: 30,
                bottom: 90,
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.black,
                  child: Text(
                    vo.location,
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyWidgetState();
  }
}

class MyWidgetState extends State<MyWidget> {
  List<CardADWidget> makeWidgets(){
    return datas.map((vo){
      return CardADWidget(vo);
    }).toList();
  }
  //손가락 따라가면서 화면을 순차적으로 보이는 위젯..PageView..의 제어자..
  PageController controller = PageController(
    initialPage: 0,
    //한장의 화면이 어느정도로 보일것인가? 1.0이면 현재 화면만 보인다.. 0.9 이면 90%로 보이고 나머지
      //10%에 인접 화면이 같이 나온다..
    viewportFraction: 0.9
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: controller,
            children: makeWidgets(),
          ),
        ),
        SmoothPageIndicator(
          controller: controller,//PageView에 연결된 controller를 그대로 지정..
          //PageView에서 화면 조정이 되면.. 그 정보가 controller내에서 유지. .
          //controller 내의 페이지 정보로 indicator 조정..
          count: 5,
          effect: WormEffect(
            dotColor: Colors.white,
            activeDotColor: Colors.indigo,
          ),
        ),
        SizedBox(height: 32.0,)//지정한 사이즈만 확보하는 위젯..
      ],
    );
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Test'),
        ),
        body: Container(
          color: Colors.pink,
          child: MyWidget(),
        )
      ),
    );
  }
}

