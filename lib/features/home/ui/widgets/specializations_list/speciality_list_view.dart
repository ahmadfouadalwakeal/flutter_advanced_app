import 'package:flutter/material.dart';
import 'package:flutter_advanced_app/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_advanced_app/features/home/ui/widgets/specializations_list/speciality_list_view_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityListView extends StatelessWidget {
  final List<SpecializationsData?> specializationsDataList;
  const SpecialityListView({super.key, required this.specializationsDataList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationsDataList.length,
        itemBuilder: (context, index) {
          return SpecialityListViewItem(
            specializationsData: specializationsDataList[index],
            itemIndex: index,
          );
        },
      ),
    );
  }
}
