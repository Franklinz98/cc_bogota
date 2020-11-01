import 'package:flutter/material.dart';

import '../widgets/filter_chip.dart';

class UpdateChips extends StatefulWidget {
  final Function updateList;

  const UpdateChips({Key key, @required this.updateList}) : super(key: key);

  @override
  _UpdateChipsState createState() => _UpdateChipsState();
}

class _UpdateChipsState extends State<UpdateChips>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  Brightness brightnessValue;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      vsync: this,
      duration: Duration(milliseconds: 200),
      child: Wrap(
        spacing: 8.0,
        runSpacing: -5.0,
        children: <Widget>[
          FilterChipWidget(
            text: "No se realizó",
            onTap: (isSelected) {
              widget.updateList.call(isSelected, "No se realizó el grupo");
            },
          ),
          FilterChipWidget(
            text: "Cerrado temporalmente",
            onTap: (isSelected) {
              widget.updateList.call(isSelected, "Grupo cerrado temporalmente");
            },
          ),
          FilterChipWidget(
            text: "Cerrado definitivamente",
            onTap: (isSelected) {
              widget.updateList
                  .call(isSelected, "Grupo cerrado definitivamente");
            },
          ),
          FilterChipWidget(
            text: "Abrió temporalmente",
            onTap: (isSelected) {
              widget.updateList
                  .call(isSelected, "Se abre el grupo temporalmente");
            },
          ),
          FilterChipWidget(
            text: "Actualizar Fama",
            onTap: (isSelected) {
              widget.updateList.call(isSelected, "Actualizar Fama");
            },
          ),
        ],
      ),
    );
  }

  @override
  void didChangePlatformBrightness() {
    setState(() {
      brightnessValue = WidgetsBinding.instance.window.platformBrightness;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
