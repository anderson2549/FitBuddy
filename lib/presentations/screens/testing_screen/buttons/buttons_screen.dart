import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});
  static const String name = 'botones';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buttons')),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SizedBox(
          child: Wrap(
            spacing: 10,
            //crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Elevated Button')),
              ElevatedButton(onPressed: null, child: Text('Elevated Button')),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.access_alarm_rounded),
                label: Text('ElevateIcon'),
              ),

              FilledButton(onPressed: () {}, child: Text('Filled')),
              FilledButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add_alert_rounded),
                label: Text('Filled icon'),
              ),
              OutlinedButton(onPressed: () {}, child: Text('OutlinedBtn')),
              OutlinedButton.icon(
                onPressed: () {},
                label: Text('OutlinedBtn'),
                icon: Icon(Icons.mode_night_sharp),
              ),
              TextButton(onPressed: () {}, child: Text('Text btn')),
              TextButton.icon(
                onPressed: () {},
                label: Text('Text icon'),
                icon: Icon(Icons.mobiledata_off_rounded),
              ),
              // TODO: custom btn
              CustomButton(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_ic_call_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_ic_call_outlined),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(color.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: Material(
        color: color.inversePrimary,
        //color: color.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text('hola mundo', style: TextStyle(color: color.onPrimary)),
          ),
        ),
      ),
    );
  }
}
