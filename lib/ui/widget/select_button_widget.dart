import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class SelectButtonWidget extends StatefulWidget {
  final String buttonKey1;
  final String image1;
  final Color? selectColorImage1;
  final Color? unSelectSecondColorImage1;
  final String buttonKey2;
  final String image2;
  final Color? selectColorImage2;
  final Color? unSelectSecondColorImage2;

  const SelectButtonWidget({
    super.key,
    required this.buttonKey1,
    required this.image1,
    this.selectColorImage1,
    this.unSelectSecondColorImage1,
    required this.buttonKey2,
    required this.image2, this.selectColorImage2, this.unSelectSecondColorImage2,

  });

  @override
  State<SelectButtonWidget> createState() => _SelectButtonWidgetState();
}

class _SelectButtonWidgetState extends State<SelectButtonWidget> {
  String moodButton = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightBlue, width: 3),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Row(
        spacing: 17,
        children: [
          GestureDetector(
            onTap: () {
              moodButton = widget.buttonKey1;
              setState(() {});
            },
            child: CircleAvatar(
              backgroundColor:
              moodButton == widget.buttonKey1
                  ? AppColors.lightBlue
                  : AppColors.transparent,
              child: Image.asset(
                widget.image1,
                color:
                moodButton == widget.buttonKey1
                    ? widget.selectColorImage1
                    : widget.unSelectSecondColorImage1,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              moodButton = widget.buttonKey2;
              setState(() {});
            },
            child: CircleAvatar(
              backgroundColor:
              moodButton == widget.buttonKey2
                  ? AppColors.lightBlue
                  : AppColors.transparent,
              child: Image.asset(
                  widget.image2,
                  color:
                  moodButton == widget.buttonKey2
                      ? widget.selectColorImage2
                  : widget.unSelectSecondColorImage2
              ),
            ),
          ),
        ],
      ),
    );
  }
}
