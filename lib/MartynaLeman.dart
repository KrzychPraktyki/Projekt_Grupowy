import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'MotiveData_MLem.dart';

void Dstrona() {
  runApp(const DrugaStrona (
    title: 'Motywy',
  ));
}


class DrugaStrona extends StatefulWidget {
  const DrugaStrona({super.key, required this.title});
  final String title;
  @override
  State<DrugaStrona> createState() => _MyAppState();
}

class _MyAppState extends State<DrugaStrona> {
  List<PaletteColor> colors = [];
  late int _currentindex;

  @override
  void initState() {
    super.initState();
    colors = [];
    _currentindex = 0;
    _updatepalettes();
  }
  _updatepalettes() async {
    for (String image in urlImages) {
      final PaletteGenerator pg = await PaletteGenerator.fromImageProvider(
          AssetImage(image),
          size: const Size(200, 200));
      colors.add(pg.dominantColor ?? PaletteColor(Colors.blue, 2));
    }
    setState(() {});
  }

  Widget make(BuildContext context) => MaterialApp(
      title: 'Motywy',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          )));


  late ThemeData light;
  late ThemeData dark;

  final urlImages = [
    'images/light.jpg',
    'images/dark.jpg',
  ];
  Color lightindigo = Colors.indigo;
  Color lightpink = Colors.pink;
  Color lightred = Colors.red;
  Color darkindigo = Colors.indigo;
  Color darkpink = Colors.pink;
  Color darkred = Colors.red;



  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => AppTheme(),
      child: Consumer<AppTheme>(builder: (context, state, child) {
        return MaterialApp(
          title: 'motyw' ,
          debugShowCheckedModeBanner: false,
          theme: state.darkTheme
              ? dark = ThemeData(
            appBarTheme: AppBarTheme(color: darkred),
            colorScheme: const ColorScheme.dark().copyWith(
              secondary: darkpink,
              brightness: Brightness.dark,
            ),
            scaffoldBackgroundColor: colors.isNotEmpty
                ? colors[_currentindex = 1].color
                : darkred,
          )
              : light = ThemeData(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: generateMaterialColor(color: lightred),
              ).copyWith(
                secondary: lightpink,
                brightness: Brightness.light,
              ),
              scaffoldBackgroundColor: colors.isNotEmpty
                  ? colors[_currentindex].color
                  : lightindigo),
          home: Scaffold(
            appBar: AppBar(
              title: state.darkTheme ? const Text("Wybieranie Motywów (Ciemny Motyw)") : Text(widget.title),
            ),
            body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => index == 0
                      ? customizetheme(context, index, "Jasny Motyw")
                      : customizetheme(context, index, "Ciemny Motyw"),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(urlImages[index])),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: index == 0
                            ? const Text('Jasny Motyw')
                            : const Text('Ciemny Motyw'),
                      )
                    ],
                  ),
                );
              },
              itemCount: urlImages.length,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ),
        );
      }));
  Widget buildappbarbackgroundColorPicker(index) => MaterialPicker(
    pickerColor: index != 0 ? darkred : lightred,
    onColorChanged: (Color color) => setState(() {
      if (index != 0) {
        darkred = color;
      } else {
        lightred = color;
      }
    }),
  );
  Widget buildbackgroundColorPicker(index) => MaterialPicker(
    pickerColor: index != 0 ? darkindigo : lightindigo,
    onColorChanged: (Color color) => setState(() {
      if (index != 0) {
        darkindigo = color;
      } else {
        lightindigo = color;
      }
    }),
  );
  Widget buildColorPicker(index) => MaterialPicker(
    pickerColor: index != 0 ? darkpink : lightpink,
    onColorChanged: (Color color) => setState(() {
      if (index != 0) {
        darkpink = color;
      } else {
        lightpink = color;
      }
    }),
  );
  void customizetheme(BuildContext context, index, String titlebody) =>
      showDialog(
          context: context,
          builder: (context) =>
              Consumer<AppTheme>(builder: (context, state, child) {
                return AlertDialog(
                  title: Text(titlebody),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Primary Swatch: "),
                        buildappbarbackgroundColorPicker(index),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("Scaffold Background: "),
                        buildbackgroundColorPicker(index),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("Secondary colorscheme"),
                        buildColorPicker(index),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Close",
                          style: TextStyle(fontSize: 20),
                        )),
                    TextButton(
                        onPressed: () {
                          if (index != 0) {
                            state.switchthemedark();
                            _currentindex = index;
                          } else {
                            state.switchthemelight();
                            _currentindex = index;
                          }
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Switch Themes",
                          style: TextStyle(fontSize: 20),
                        )),

                  ],
                );
              }));
}




@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Motyw'),
    ),
    body: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('back!'),
      ),
    ),
  );
}