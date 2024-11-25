import 'package:Afaq/main.dart';
import 'package:Afaq/ui/common/app_colors.dart';
import 'package:Afaq/ui/common/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../custom_components/custom_drawer.dart';
import 'package:Afaq/ui/views/dashboard/dashboard_viewmodel.dart';

class DashboardView extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40), // Rounded bottom left corner
              bottomRight: Radius.circular(40), // Rounded bottom right corner
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: IconButton(onPressed:  () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
                   icon:  Icon(Icons.menu, color: Colors.black),),
            ),



            title: Image.asset(
              AppImages.rideLogo, // Replace with your logo
              height: 50.h,
              width: 132.w,
            ),
            centerTitle: true,
            actions: [
              GestureDetector(
                onTap: () {
                  print('Profile icon tapped!');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      AppImages.profileLogo,
                    ), // Replace with profile image
                    radius: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: CustomDrawer(), // Your custom drawer
      body: Center(),
    );
  }
}
