import 'package:Afaq/main.dart';
import 'package:Afaq/ui/common/app_colors.dart';
import 'package:Afaq/ui/common/assets.dart';
import 'package:Afaq/ui/common/textstyles.dart';
import 'package:Afaq/ui/custom_components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../custom_components/custom_drawer.dart';
import 'dashboard_viewmodel.dart';

class DashboardView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        key: viewModel.scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
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
              leading: IconButton(
                onPressed: () {
                  viewModel.scaffoldKey.currentState?.openDrawer();
                },
                icon: Icon(Icons.menu, color: Colors.black),
              ),
              title: Image.asset(
                AppImages.rideLogo,
                height: 50.h,
                width: 132.w,
              ),
              centerTitle: true,
              actions: [
                GestureDetector(
                  onTap: () {
                    // viewModel.onProfileIconTapped();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(AppImages.profileLogo),
                      radius: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: CustomDrawer(),
        body: Column(
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                cursorHeight: 20.h,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.Kcwhite,
                  hintText: 'Choose a pick point',
                  hintStyle: TextStyles.Regularlight.copyWith(color: Colors.grey),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      AppSVGS.pickupIcon,
                      width: 15.w,
                      height: 10.h,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColors.Kcwhite),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.Kcwhite),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.Kcwhite),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                cursorHeight: 20.h,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.Kcwhite,
                  hintText: 'Choose your destination',
                  hintStyle: TextStyles.Regularlight.copyWith(color: Colors.grey),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      AppSVGS.locationIcon,
                      width: 15.w,
                      height: 10.h,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColors.Kcwhite),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.Kcwhite),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.Kcwhite),
                  ),
                ),
              ),
            ),
            Stack(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
