import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Weather Forecast'),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.red,
      body: const Body(),
    ),
  ));
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _findLogo(),
        _paddingHeight(32),
        _cityInfo(),
        _paddingHeight(40),
        _weatherToday(),
        _paddingHeight(40),
        _stringIcons(),
        _paddingHeight(40),
        _weatherTextInfo(),
        Expanded(child: _listWeather())
      ],
    );
  }

  Widget _findLogo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: const [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            'Enter City Name',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _paddingHeight(double num) {
    return SizedBox(
      height: num,
    );
  }

  Widget _cityInfo() {
    return Column(
      children: const [
        Text(
          'Murmansk Oblast, RU',
          style: TextStyle(color: Colors.white, fontSize: 32),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Friday, Mar 20, 2020',
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }

  Widget _weatherToday() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.sunny,
          size: 64,
          color: Colors.white,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              '14  °F',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            Text(
              'LIGHT SNOW',
              style: TextStyle(color: Colors.white),
            ),
          ],
        )
      ],
    );
  }

  Widget _stringIcons() {
    List<WeatherInfo> info = [
      WeatherInfo(
          num: const Text(
            '5',
            style: ColorsText.whiteText,
          ),
          info: const Text(
            'km/hr',
            style: ColorsText.whiteText,
          )),
      WeatherInfo(
          num: const Text(
            '3',
            style: ColorsText.whiteText,
          ),
          info: const Text(
            '%',
            style: ColorsText.whiteText,
          )),
      WeatherInfo(
          num: const Text(
            '20',
            style: ColorsText.whiteText,
          ),
          info: const Text(
            '%',
            style: ColorsText.whiteText,
          ))
    ];
    List<Widget> widgets = [];
    for (WeatherInfo i in info) {
      widgets.add(Column(
        children: [i.icon, const SizedBox(height: 4,), i.num, i.info],
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: widgets,
    );
  }

  Widget _weatherTextInfo() {
    return const Text('7-DAY WEATHER FORECAST',  style: ColorsText.whiteText,);
  }

  Widget _listWeather() {
    return  ListView(
      padding: const EdgeInsets.all(8.0),
      scrollDirection: Axis.horizontal,
      itemExtent: 120,
      children: [
      _listOneElement(day: 'Friday', num: '6'),
      _listOneElement(day: 'Saturday', num: '8'),
      _listOneElement(day: 'Sunday', num: '22'),
      _listOneElement(day: 'Monday', num: '25'),
      _listOneElement(day: 'Tuesday', num: '14'),
      _listOneElement(day: 'Wednesday', num: '25'),
      _listOneElement(day: 'Thursday', num: '10'),
    ],);
  }

  Widget _listOneElement({required String day, required String num}) {
    return Container(
      color: Color.fromRGBO(255, 255, 255, 0.33725490196078434),
      margin: EdgeInsets.only(right: 2),
      child: ListTile(title: Text(day, style: ColorsText.whiteText,), subtitle: Row(children: [
        Text(num, style: ColorsText.whiteText,),
        const Text(' °F ', style: ColorsText.whiteText,),
        Icon(Icons.sunny, color: Colors.white,)
      ],),),
    );
  }
}

class WeatherInfo {
  final Icon icon = const Icon(
    Icons.ac_unit,
    color: Colors.white,
  );
  final Text num;
  final Text info;

  WeatherInfo({required this.num, required this.info});
}

abstract class ColorsText {
  static const whiteText = TextStyle(color: Colors.white);
}
