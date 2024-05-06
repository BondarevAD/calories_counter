import 'package:calories_counter/data/entities/day.dart';
import 'package:calories_counter/presentation/pages/main/tabs/home_body/cubit/home_cubit.dart';
import 'package:calories_counter/presentation/pages/main/tabs/home_body/cubit/home_state.dart';
import 'package:calories_counter/presentation/pages/main/tabs/home_body/info_page/widgets/day_section.dart';
import 'package:calories_counter/presentation/pages/main/tabs/home_body/widgets/day_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key, required this.days});

  final List<DayData> days;

  @override
  State<StatefulWidget> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late final PageController _daySectionController;
  late final PageController _dayController;
  late final PageController _caloriesController;

  @override
  void initState() {
    super.initState();
    _dayController = PageController();
    _daySectionController = PageController(
      viewportFraction: 0.8,
    )..addListener(onDayChanged);
    _caloriesController = PageController();
  }

  @override
  void dispose() {
    _daySectionController.removeListener(onDayChanged);
    _daySectionController.dispose();
    _dayController.dispose();
    _caloriesController.dispose();
    super.dispose();
  }

  void onDayChanged() {
    _dayController.jumpTo(
      _daySectionController.offset *
          _dayController.viewportFraction /
          _daySectionController.viewportFraction,
    );
    _daySectionController.jumpTo(
      _caloriesController.offset *
          _daySectionController.viewportFraction /
          _caloriesController.viewportFraction,
    );
  }

  double getCaloriesForDay(DayData day) {
    var result = 0.0;
    for (final product in day.products.items) {
      result += product.calories;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body(context),
    );
  }

  AppBar get _appBar {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.keyboard_arrow_down),
        onPressed: () => Get.back(),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.days.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(widget.days[index].date),
                  DayInfo(day: widget.days[index]),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
