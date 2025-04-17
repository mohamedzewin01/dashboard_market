import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late InAppWebViewController _controller;
  bool _isWebViewReady = false;

  void _reloadWebView() {
    if (_isWebViewReady) {
      _controller.reload();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سوبر ماركت فضاء الخليج'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Row(
            children: [
              // ✅ الجزء الخاص بالتعليمات
              Expanded(flex: 2,
                child: SizedBox(
                   // حجم ثابت
                  child: WebInstructionsView(onReload: _reloadWebView),
                ),
              ),

              // ✅ خط فاصل بسيط
              const VerticalDivider(width: 1),

              // ✅ الجزء الخاص بالويب
              Expanded(
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: WebUri("https://marketfadaalhalij.artawiya.com/"),
                  ),
                  onWebViewCreated: (controller) {
                    _controller = controller;
                    setState(() {
                      _isWebViewReady = true;
                    });
                  },
                  onLoadStart: (_, __) => setState(() => _isWebViewReady = false),
                  onLoadStop: (_, __) => setState(() => _isWebViewReady = true),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class WebInstructionsView extends StatelessWidget {
  final VoidCallback onReload;

  const WebInstructionsView({super.key, required this.onReload});

  @override
  Widget build(BuildContext context) {
    final instructions = [
      ('🔁', 'لتحديث الصفحة اضغط: F5'),
      ('↕️', 'للتحرك أعلى/أسفل: Scroll بالماوس'),
      ('🖱️', 'للتمرير الأفقي: Shift + عجلة الماوس'),
    ];

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '📋 تعليمات الاستخدام',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: instructions.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final (icon, text) = instructions[index];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(icon, style: const TextStyle(fontSize: 24)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        text,
                        style: const TextStyle(fontSize: 15),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: onReload,
            icon: const Icon(Icons.refresh, color: Colors.white),
            label: const Text(
              'تحديث الصفحة',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo, // لون الخلفية
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 100),


        ],
      ),
    );
  }
}
