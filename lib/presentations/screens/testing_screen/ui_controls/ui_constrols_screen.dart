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
          title: Text('Developer Mode'),
          subtitle: Text('controles adicionales'),
        ),
        ExpansionTile(
          enabled: true,
          title: Text('Transportations'),
          subtitle: Text('$transpor'),
          //initiallyExpanded: true,
          children: [
            RadioListTile(
              title: Text("Carro"),
              subtitle: Text("viajaar carro"),
              value: Transportation.car,
              groupValue: transpor,
              onChanged:
                  (value) => setState(() {
                    transpor = Transportation.car;
                  }),
            ),
            RadioListTile(
              title: Text("moto"),
              subtitle: Text("viajaar moto"),
              value: Transportation.moto,
              groupValue: transpor,
              onChanged:
                  (value) => setState(() {
                    transpor = Transportation.moto;
                  }),
            ),
            RadioListTile(
              title: Text("tren"),
              subtitle: Text("viajaar tren"),

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
          title: Text('Desayuno?'),
          subtitle: Text('Quiere desa'),
          value: wantBreakfast,
          onChanged: (value) {
            wantBreakfast = !wantBreakfast;
            setState(() {});
          },
        ),
        CheckboxListTile(
          title: Text('almuerzo?'),
          subtitle: Text('Quiere desa'),
          value: wantLunch,
          onChanged: (value) {
            wantLunch = !wantLunch;
            setState(() {});
          },
        ),
        CheckboxListTile(
          title: Text('cena?'),
          subtitle: Text('Quiere cena'),
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
