import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sizer/sizer.dart';

class City extends StatefulWidget {
  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  List days = [
    'Jan 8, 2021 | 21:00 ',
    'Feb 10, 2021 | 03:00',
    'Mar 11, 2021 | 15:00',
    'Apr 22, 2021 | 12:00',
    'May 31, 2021 | 18:00',
  ];

  List<bool> isVisible = List<bool>.generate(5, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Melbourne, Australia',
          style: TextStyle(
            fontSize: 12.0.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 2.0.h),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isVisible[index] = !isVisible[index];
                  });
                },
                child: Container(
                  height: isVisible[index] ? null : 60,
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 0.5.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            days[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            !isVisible[index]
                                ? Icons.arrow_drop_down
                                : Icons.arrow_drop_up,
                            color: Colors.black,
                          )
                        ],
                      ),
                      Visibility(
                        visible: isVisible[index],
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: ListTile(
                                    title: Text(
                                      'Humidity',
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 12.0.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          FlutterIcons.water_mco,
                                          color: Colors.blue,
                                          size: 17.0.sp,
                                        ),
                                        SizedBox(width: 1.0.w),
                                        Text(
                                          '27%',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11.0.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: ListTile(
                                    title: Text(
                                      'Wind Speed',
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 12.0.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Icon(
                                          FlutterIcons.wind_faw5s,
                                          color: Colors.blue,
                                          size: 15.0.sp,
                                        ),
                                        SizedBox(width: 1.0.w),
                                        Text(
                                          '7 m/s',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11.0.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: ListTile(
                                    title: Text(
                                      'Feels Like',
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 12.0.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      '20\u00B0',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11.0.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: ListTile(
                                    title: Text(
                                      'Weather',
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 12.0.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      'Clear Sky',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11.0.sp,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: ListTile(
                                    title: Text(
                                      'High',
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 12.0.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      '20\u00B0',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11.0.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: ListTile(
                                    title: Text(
                                      'Low',
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 12.0.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      '20\u00B0',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11.0.sp,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
