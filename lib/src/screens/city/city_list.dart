import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:weather/src/appstate_container.dart';
import 'package:weather/src/model/forecast_model.dart';

class CityUtil {
  static Widget cityList(
      {@required BuildContext context, @required List<ForecastModel> weather}) {
    return StateContainer.of(context).isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 3.0.w,
              mainAxisSpacing: 1.0.h,
              childAspectRatio: 1.15,
            ),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              vertical: 2.0.h,
            ),
            itemCount: weather.length,
            physics: ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var city = StateContainer.of(context).cities.singleWhere(
                    (element) => element.id == weather[index].cityID,
                  );

              return InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('/city', arguments: {'cityId': city.id});
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.0.w,
                    vertical: 0.75.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        // tileColor: Colors.amber,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          '${weather[index].temp ?? ' '}\u00B0',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0.sp,
                          ),
                        ),
                        trailing: CachedNetworkImage(
                          height: 60,
                          width: 60,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          imageUrl: weather[index].weather.image ??
                              'http://openweathermap.org/img/wn/10d@2x.png',
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          errorWidget: (_, url, error) {
                            return Icon(Icons.error);
                          },
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            city.name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0.sp,
                            ),
                          ),
                          Text(
                            city.country,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 11.0.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                FlutterIcons.water_mco,
                                color: Colors.blue,
                                size: 17.0.sp,
                              ),
                              SizedBox(width: 1.0.w),
                              Text(
                                '${weather[index].humidity ?? ''}%',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.0.sp,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                FlutterIcons.wind_faw5s,
                                color: Colors.blue,
                                size: 15.0.sp,
                              ),
                              SizedBox(width: 1.0.w),
                              Text(
                                '${weather[index].windSpeed ?? ''}m/s',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.0.sp,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
  }
}
