import 'package:flutter/material.dart';




class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: SeparatedColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          separator: SizedBox(height: 8),
          children: [
            _Button(
              label: 'Sample 1',
              page: Scaffold(),
            ),
            _Button(
              label: 'Photo History',
              page:  Scaffold(),
            ),
            _Button(
              label: 'Big Video Upload',
              page:  Scaffold(),
            ),
            _Button(
              page:  Scaffold(),
              label: 'Upload Multi Videos',
            ),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.label,
    required this.page,
  });

  final String label;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => page),
      ),
      child: Text(label),
    );
  }
}

class SeparatedColumn extends StatelessWidget {
  const SeparatedColumn({
    required this.separator,
    this.children = const [],
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final Widget separator;
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  Iterable<Widget> _expandIndexed() sync* {
    for (var index = 0; index < children.length; index++) {
      yield children[index];
      if (index < children.length - 1) {
        yield separator;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: _expandIndexed().toList(),
    );
  }
}