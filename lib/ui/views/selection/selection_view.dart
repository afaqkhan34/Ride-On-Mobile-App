import 'package:Afaq/ui/common/assets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'selection_viewmodel.dart';

class SelectionView extends StackedView<SelectionViewModel> {
  const SelectionView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SelectionViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 6,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.passwordReset,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8),
                Text(
                  'Card Title',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }

  @override
  SelectionViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SelectionViewModel();
}
