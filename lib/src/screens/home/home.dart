import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 1.5.h),
          width: 100.0.w,
          decoration: BoxDecoration(
              // color: Colors.greenAccent,
              ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black87,
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 1.0.w),
                  leading: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.cancel_sharp,
                      color: Colors.white,
                    ),
                  ),
                  title: TextField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.0.sp,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      hintText: 'Search by city name',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 11.0.sp,
                      ),
                      hintMaxLines: 1,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
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
                  itemCount: 4,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
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
                              '20\u00B0',
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
                              imageUrl:
                                  'http://openweathermap.org/img/wn/10d@2x.png',
                              imageBuilder: (context, imageProvider) =>
                                  Container(
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
                                'Bangkok',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0.sp,
                                ),
                              ),
                              Text(
                                'UK',
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
                                    '27%',
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
                                    '7 km/h',
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
                    );
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