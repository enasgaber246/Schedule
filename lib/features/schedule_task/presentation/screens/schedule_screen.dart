import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:schedule/core/utils/app_colors.dart';
import 'package:schedule/core/utils/app_strings.dart';
import 'package:schedule/features/schedule_task/data/models/EventsResponse.dart';
import 'package:schedule/features/schedule_task/presentation/bloc/schedule_bloc.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../data/datasources/network/endpoints.dart';
import '../widgets/date_widget.dart';
import '../widgets/header.dart';
import '../widgets/joined_users_widget.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ScheduleScreenState();
  }
}

class ScheduleScreenState extends State<ScheduleScreen> {
  static const _pageSize = 10;
  int currentPage = 1;

  final PagingController<int, EventsResponse> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      currentPage++;
      _bloc.add(LoadScheduleEvent(currentPage));
      print('addPageRequestListener');
    });

    _pagingController.addListener(() {
      // print('_pagingController :  ${_pagingController.}');
      print('addListener');
    });

    _pagingController.addStatusListener((status) {
      print('addStatusListener');
    });

    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Header(),
        _listBloc(),
      ],
    )));
  }

  final ScheduleBloc _bloc = ScheduleBloc();

  Widget _listBloc() {
    return BlocProvider<ScheduleBloc>(
      create: (context) => _bloc..add(LoadScheduleEvent(1)),
      child:
          BlocBuilder<ScheduleBloc, ScheduleState>(builder: (context, state) {
        if (state is LoadingScheduleState) {
          return Container(
            padding: const EdgeInsets.all(148.0),
            child: const Center(
                child: CircularProgressIndicator(
              color: AppColors.primary,
            )),
          );
        } else if (state is LoadedScheduleState) {
          final isLastPage = state.response.length < _pageSize;
          if (isLastPage) {
            _pagingController.appendLastPage(state.response);
          } else {
            final nextPageKey = state.pageKey + state.response.length;
            _pagingController.appendPage(state.response, nextPageKey);
          }

          return _list(state.response.first);
        } else if (state is ChangeDateState) {
          return _list(state.item);
        } else if (state is FailedScheduleState) {
          return Text(AppStrings.errorMsg,
              style: Theme.of(context).textTheme.headline3);
        } else {
          return Text(AppStrings.errorMsg,
              style: Theme.of(context).textTheme.headline3);
        }
      }),
    );
  }

  Widget _list(item) {
    return Expanded(
      child: Column(
        children: [
          DateWidget(item: item),
          Expanded(
            child: PagedListView<int, EventsResponse>(
              pagingController: _pagingController,
              shrinkWrap: true,
              builderDelegate: PagedChildBuilderDelegate<EventsResponse>(
                itemBuilder: (context, item, index) => _buildTimelineTile(item),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineTile(EventsResponse item) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.1,
      indicatorStyle: IndicatorStyle(
          width: 38.0,
          height: 68.0,
          indicator: indicator(item),
          indicatorXY: 0.2),
      beforeLineStyle: const LineStyle(thickness: 0.5),
      endChild: _listTile(item),
    );
  }

  Widget _listTile(EventsResponse item) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 132.0,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 10.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      '${Endpoints.imageUrl}${item.images![0].url}',
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  child: Container(
                      height: 28.0,
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.85),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(22)),
                        shape: BoxShape.rectangle,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          if (item.tag!.icon != null)
                            Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.white),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  "${Endpoints.imageUrl}${item.tag!.icon}",
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text(item.tag!.title.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .merge(const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.black))))
                        ],
                      )),
                ),
                Positioned(
                    bottom: 15.0,
                    left: 0.0,
                    child: Container(
                        width: 80.0,
                        height: 24.0,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.85),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(22)),
                          shape: BoxShape.rectangle,
                        ),
                        child: Center(
                            child: Text('${item.spots} Spots Left',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .merge(const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primary))))))
              ],
            ),
            Text(getDate(item.date.toString()),
                style: Theme.of(context).textTheme.headline3!.merge(
                    const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.normal))),
            Text(item.title!,
                style: Theme.of(context).textTheme.headline1!.merge(
                    const TextStyle(color: AppColors.black, fontSize: 14))),
            Text(item.placeName!,
                style: Theme.of(context).textTheme.headline3!.merge(
                    const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.normal))),
            // addressBloc(double.parse(item.lat.toString()),
            //     double.parse(item.lon.toString())),
            Text('${getDaysBetween(item.date!)} ${AppStrings.daysLeft}',
                style: Theme.of(context).textTheme.headline3!.merge(
                    const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color: AppColors.primary))),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if ((item.price ?? 0) > 0)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(Icons.monetization_on_outlined,
                            size: 18, color: AppColors.primary),
                        Icon(Icons.payment, size: 18, color: AppColors.primary),
                        Icon(Icons.payment, size: 18, color: AppColors.primary)
                      ],
                    ),
                  ((item.price ?? 0) > 0)
                      ? Text('AED ${item.price}',
                          style: Theme.of(context).textTheme.headline1!.merge(
                              const TextStyle(
                                  color: AppColors.primary, fontSize: 12)))
                      : Text('FREE',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline1!.merge(
                              const TextStyle(
                                  color: AppColors.primary, fontSize: 12))),
                  JoinedUsersWidget(users: item.users ?? [])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget indicator(EventsResponse item) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: AppColors.primary),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(getDayNumber(item.date!),
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .merge(const TextStyle(color: AppColors.white))),
          Text(getDayName(item.date!),
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .merge(const TextStyle(color: AppColors.white))),
        ],
      ),
    );
  }

  String getDate(String dateString) {
    DateTime tempDate =
        DateFormat("yyyy-MM-ddThh:mm:ss.sssZ").parse(dateString);
    String date = DateFormat("EEE, dd MMM yyyy . hh:mm a").format(tempDate);
    return date;
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
    String date = DateFormat("EEE").format(tempDate);
    return date;
  }

  String getDaysBetween(String dateString) {
    DateTime tempDate =
        DateFormat("yyyy-MM-ddThh:mm:ss.sssZ").parse(dateString);
    final date2 = DateTime.now();
    String difference = tempDate.difference(date2).inDays.toString();

    return difference;
  }
}
