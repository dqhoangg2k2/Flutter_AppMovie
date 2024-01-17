import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/gen/assets.gen.dart';
import 'package:movie_app/resources/app_color.dart';

class MvSearchBox extends StatelessWidget {
  const MvSearchBox({
    super.key,
    this.onTap,
    this.onChanged,
    this.readOnly = false,
  });

  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
        color: AppColor.h3A3F47,
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: TextField(
        onTap: onTap,
        onChanged: onChanged,
        readOnly: readOnly,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: const TextStyle(color: AppColor.h67686D),
          // suffixIcon: Icon(Icons.search, size: 26.0, color: AppColor.h67686D),
          suffixIcon: SvgPicture.asset(
            Assets.icons.search,
            width: 18.0,
            height: 18.0,
            // ignore: deprecated_member_use
            color: AppColor.h67686D,
            fit: BoxFit.scaleDown,
          ),
          suffixIconConstraints: const BoxConstraints(minWidth: 46.0),
        ),
      ),
    );
  }
}
