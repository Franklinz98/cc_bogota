import 'package:cc_bogota/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterChipWidget extends StatefulWidget {
  final String text;
  final ValueChanged<bool> onTap;

  const FilterChipWidget({
    Key key,
    @required this.text,
    @required this.onTap,
  }) : super(key: key);

  @override
  _FilterChipWidgetState createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  bool _selected;

  @override
  void initState() {
    super.initState();
    _selected = false;
  }

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        widget.text.toUpperCase(),
      ),
      labelStyle: GoogleFonts.manrope(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: Colors.white,
      ),
      checkmarkColor: Colors.white,
      backgroundColor: AppColors.maize.withOpacity(0.18),
      selectedColor: AppColors.maize,
      onSelected: (isSelected) {
        setState(() {
          _selected = isSelected;
        });
        widget.onTap.call(_selected);
      },
      selected: _selected,
    );
  }
}
