import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule/core/utils/app_colors.dart';
import 'package:schedule/core/utils/app_strings.dart';
import '../../data/datasources/network/schedule_api.dart';
import '../../data/repositories/schedule_repository.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.black),
                shape: BoxShape.circle),
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.black,
                ),
                onPressed: () {

                }),
          ),
          Expanded(
              child: Text(
            AppStrings.appName,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .merge(TextStyle(color: AppColors.black)),
          ))
        ],
      ),
    );
  }
}
