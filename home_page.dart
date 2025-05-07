import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/common/background_container.dart';
import 'package:restaurant_app/common/custom_appbar.dart';
import 'package:restaurant_app/common/home_file.dart';
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/views/home_tabs.dart';
import 'package:restaurant_app/views/widget/orders/cancelled_orders.dart';
import 'package:restaurant_app/views/widget/orders/delivered_orders.dart';
import 'package:restaurant_app/views/widget/orders/new_orders.dart';
import 'package:restaurant_app/views/widget/orders/picked_orders.dart';
import 'package:restaurant_app/views/widget/orders/preparing.dart';
import 'package:restaurant_app/views/widget/orders/ready_orders.dart';
import 'package:restaurant_app/views/widget/orders/self_deliveries.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: orderList.length,
    vsync: this,
  );

  Widget _safeBuild(Widget Function() builder) {
  try {
    return builder();
  } catch (e, stack) {
    debugPrint('Error building widget: $e');
    debugPrintStack(stackTrace: stack);
    return Center(child: Text('Error loading tab'));
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        flexibleSpace: CustomAppbar(),
      ),
      body: BackgroundContainer(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 15.h),
            HomeWidget(),
            SizedBox(height: 15.h),

            HomeTabs(tabController: _tabController),

            SizedBox(
              height: 15.h,
            ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            height: height * 0.7,
            color: Colors.transparent,
            child: TabBarView(
              controller: _tabController,
             children: [
  _safeBuild(() => NewOrders()),
  _safeBuild(() => Preparing()),
  _safeBuild(() => ReadyOrders()),
  _safeBuild(() => PickedOrders()),
  _safeBuild(() => SelfDeliveries()),
  _safeBuild(() => DeliveredOrders()),
  _safeBuild(() => CancelledOrders()),
],

            ),
          )
          ],
        ),
      ),
    );
  }
}
