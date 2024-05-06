import 'package:calories_counter/data/entities/day.dart';
import 'package:calories_counter/presentation/pages/main/tabs/home_body/cubit/home_cubit.dart';
import 'package:calories_counter/presentation/pages/main/tabs/home_body/cubit/home_state.dart';
import 'package:calories_counter/presentation/pages/main/tabs/home_body/widgets/day_section.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DaysSection extends StatelessWidget {
  const DaysSection({super.key, required this.days});

  final List<DayData> days;

  double getCaloriesForDay(DayData day) {
    var result = 0.0;
    for (final product in day.products.items) {
      result += product.calories;
    }
    return result;
  }

  double getCaloriesForToday(List<DayData> days) {
    final today = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd');
    final formatted = formatter.format(today);
    final todayInfo = days.where((element) =>
        formatter.format(DateTime.parse(element.date)) == formatted);
    if (todayInfo.isEmpty) return 0.0;
    return getCaloriesForDay(todayInfo.first);
  }

  String getTodayDate() {
    final today = DateTime.now();
    final formatter = DateFormat('MMMM, d');
    return formatter.format(today);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        getTodayDate(),
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                      Text(
                        "${getCaloriesForToday(days).toString()} kCal",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length,
                  itemBuilder: (context, index) {
                    return DaySection(day: days[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
