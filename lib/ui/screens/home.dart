import 'package:flutter/material.dart';
import '../../state/state_provider.dart';
import '../navigation.dart';
import '../widgets/weather_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(NavRouteName.settings);
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 24),
                    child: Text(
                      'НАРОДНЫЕ ПРИМЕТЫ И ПРАЗДНИКИ В МАРТЕ',
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('''
              Март сухой да мокрый май — будет каша да каравай.
              Рано затает — долго не растает.
              Засушливая весна — к дождливой осени, длинные сосульки — к затяжной весне, частые туманы предвещают дождливое лето, сухая погода — плодородие, а дождливая — неурожай.
              14 марта — Евдокия Плющиха. Евдокия красна — и весна красна, какова Евдокия — таково и лето, на Евдокию погоже — все лето пригоже, откуда ветер с Евдокии, оттуда и все лето, на Евдокию вода — на Егория (6 мая) трава. Если в этот день снег с дождем и теплый ветер — к мокрому лету, а мороз и северный ветер — к холодному.
              15 марта — Федот. На Федота занос — долго травы не будет.
              17 марта — Герасим Грачевник.
              18 марта — Конон-огородник. Считалось, если на Конона ведро, то градобития летом не будет.
              22 марта — сорок мучеников. Сорок мучеников — сорок утренников, предстоит еще сорок заморозков.
              23 марта. Если день туманом мглист — будет лен волокнист.
              Март-месяц любит куролесить: морозом гордится и на нос садится.
              Февраль силен метелями, а март — капелями.
              Пришел марток — надевай семеро порток.
              Если в мартовские метели снег ложится на полях волнисто, то хорошо родятся овощи и яровые хлеба.
              Если утренники с этого дня продолжаются постоянно, то лето будет теплым. Наши предки верили в то, что в этот день из теплых стран прилетают сорок разных птиц и первая из них — жаворонок.
              Лес почернел — к оттепели. На раннем льду появилась вода — к теплу.
              Ранний прилет грачей и жаворонков — к ранней весне.
              Если грачи прямо на гнезда летят — к дружной весне.
              Облака плывут высоко и быстро — к хорошей погоде.'''),
                  ),
                ],
              )),
          WeatherWidget(scrollController: scrollController),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: StateProvider.of(context).updateWeather,
        child: const Icon(Icons.update),
      ),
    );
  }
}
