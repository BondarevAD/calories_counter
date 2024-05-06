import 'package:calories_counter/data/entities/day.dart';
import 'package:calories_counter/presentation/pages/main/tabs/home_body/widgets/progress_bar.dart';
import 'package:flutter/material.dart';

class DaySection extends StatelessWidget {
  const DaySection({super.key, required this.day});

  final DayData day;

  Color getColor(double calories, double goalCalories) {
    if (calories / goalCalories < 0.3) return Colors.red;
    if (calories / goalCalories < 0.7) return Colors.lightBlue;
    if (calories / goalCalories <= 1) return Colors.lightGreen;
    return Colors.red;
  }

  double getHeight(double calories, double goalCalories) {
    if (calories / goalCalories >= 1) return 8;
    return 90 * (1 - (calories / goalCalories));
  }

  String parseData(String dateString) {
    const Map<int, String> monthsInYear = {
      1: "Jan",
      2: "Feb",
      3: "Mar",
      4: "Apr",
      5: "May",
      6: "June",
      7: "Jule",
      8: "Aug",
      9: "Sep",
      10: "Oct",
      11: "Nov",
      12: "December",
    };
    final date = DateTime.parse(dateString);

    return "${date.day} ${monthsInYear[date.month]}";
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
    return Column(
      children: [
        ProgressBar(
          color: getColor(getCaloriesForDay(day), 1600),
          height: getHeight(getCaloriesForDay(day), 1600),
        ),
        Text(
          parseData(day.date),
        ),
      ],
    );
  }
}
