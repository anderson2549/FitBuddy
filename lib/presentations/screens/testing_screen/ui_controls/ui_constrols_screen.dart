import 'package:flutter/material.dart';

class UiConstrolsScreen extends StatelessWidget {
  static const name = 'uicontrols_screen';

  const UiConstrolsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Control UI')),
      body: _ControlUIView(),
    );
  }
}

enum Transportation { car, moto, train }

class _ControlUIView extends StatefulWidget {
  @override
  State<_ControlUIView> createState() => _ControlUIViewState();
}

class _ControlUIViewState extends State<_ControlUIView> {
  bool isDeveloper = false;
  bool wantBreakfast = false;
  bool wantDinner = false;
  bool wantLunch = false;
  Transportation transpor = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDeveloper,
          onChanged:
              (e) => setState(() {
                isDeveloper = !isDeveloper;
              }),
          title: Text('developer_mode_title'),
          subtitle: Text('developer_mode_subtitle'),
        ),
        ExpansionTile(
          enabled: true,
          title: Text('transportations_title'),
          subtitle: Text('$transpor'),
          //initiallyExpanded: true,
          children: [
            RadioListTile(
              title: Text('transportation_car'),
              subtitle: Text('transportation_car_subtitle'),
              value: Transportation.car,
              groupValue: transpor,
              onChanged:
                  (value) => setState(() {
                    transpor = Transportation.car;
                  }),
            ),
            RadioListTile(
              title: Text('transportation_moto'),
              subtitle: Text('transportation_moto_subtitle'),
              value: Transportation.moto,
              groupValue: transpor,
              onChanged:
                  (value) => setState(() {
                    transpor = Transportation.moto;
                  }),
            ),
            RadioListTile(
              title: Text('transportation_train'),
              subtitle: Text('transportation_train_subtitle'),

              value: Transportation.train,
              groupValue: transpor,
              onChanged:
                  (value) => setState(() {
                    transpor = Transportation.train;
                  }),
            ),
          ],
        ),

        CheckboxListTile(
          title: Text('breakfast_title'),
          subtitle: Text('breakfast_subtitle'),
          value: wantBreakfast,
          onChanged: (value) {
            wantBreakfast = !wantBreakfast;
            setState(() {});
          },
        ),
        CheckboxListTile(
          title: Text('lunch_title'),
          subtitle: Text('lunch_subtitle'),
          value: wantLunch,
          onChanged: (value) {
            wantLunch = !wantLunch;
            setState(() {});
          },
        ),
        CheckboxListTile(
          title: Text('dinner_title'),
          subtitle: Text('dinner_subtitle'),
          value: wantDinner,
          onChanged: (value) {
            wantDinner = !wantDinner;
            setState(() {});
          },
        ),
      ],
    );
  }
}
