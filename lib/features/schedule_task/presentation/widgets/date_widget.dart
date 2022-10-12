import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/models/EventsResponse.dart';

class DateWidget extends StatefulWidget {
  final EventsResponse item;

  const DateWidget({super.key, required this.item});

  @override
  State<StatefulWidget> createState() {
    return DateWidgetState();
  }
}

class DateWidgetState extends State<DateWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 52.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            shape: BoxShape.rectangle,
          ),
          child: IconButton(
              icon: const Icon(
                Icons.calendar_today_outlined,
                color: AppColors.primary,
              ),
              onPressed: () {}),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: double.infinity,
          child: Text(getDayNumber(widget.item.date!), style: Theme.of(context).textTheme.headline2),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(getDayName(widget.item.date!), style: Theme.of(context).textTheme.headline3),
            Text(getDateString(widget.item.date!),
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .merge(const TextStyle(color: AppColors.black)))
          ],
        )
      ]),
    );
  }

  String getDayNumber(String dateString) {
    DateTime tempDate =
    DateFormat("yyyy-MM-ddThh:mm:ss.sssZ").parse(dateString);
    String date = DateFormat("dd").format(tempDate);
    return date;
  }

  String getDayName(String dateString) {
    DateTime tempDate =
    DateFormat("yyyy-MM-ddThh:mm:ss.sssZ").parse(dateString);
    String date = DateFormat("EEEE").format(tempDate);
    return date;
  }

  String getDateString(String dateString) {
    DateTime tempDate =
    DateFormat("yyyy-MM-ddThh:mm:ss.sssZ").parse(dateString);
    String date = DateFormat("MMM yyyy").format(tempDate);
    return date;
  }
}
