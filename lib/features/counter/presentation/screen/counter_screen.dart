import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_app/features/counter/presentation/provider/counter_provider.dart';
import 'package:flutter_clean_app/features/counter/presentation/widget/button_widget.dart';
import 'package:flutter_clean_app/features/settings/presentation/screen/setting_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CounterScreen extends ConsumerStatefulWidget {

  static String name = '/counter';
  
  const CounterScreen({super.key});
  
  @override
  ConsumerState<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends ConsumerState<CounterScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final counter = ref.watch(counterProvider);
    final theme = Theme.of(context);

    ref.listen(counterProvider, (previous, next) {
      if (previous?.historyCounter.length != next.historyCounter.length) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
          );
        });
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: "Configuración",
            onPressed: () {
              GoRouter.of(context).push(SettingsScreen.name);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        
              BounceIn(
                duration: const Duration(milliseconds: 500),
                key: ValueKey(counter.count),
                child: Text(
                  counter.count.toString(),
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w100
                  )
                ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 30,
                children: [
        
                  ButtonCustom(
                    icon: Icons.remove,
                    onPressed: () {
                      if(counter.count > 0) {
                        ref.read(counterProvider.notifier).decrement();
                      }
                    },
                  ),

                  ButtonCustom(
                    icon: Icons.refresh,
                    onPressed: () {
                      if(counter.count > 0) {
                        ref.read(counterProvider.notifier).reset();
                      }
                    },
                  ),
        
                  ButtonCustom(
                    icon: Icons.add,
                    onPressed: () {
                      ref.read(counterProvider.notifier).increment();
                    },
                  ),
                ],
              ),

              SizedBox(height: 30),

              Text("Historial", style: theme.textTheme.titleLarge,),

              SizedBox(height: 15),
        
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: counter.historyCounter.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        counter.historyCounter.values.elementAt(index)
                      ),
                      subtitle: Text(
                        "${counter.historyCounter.keys.elementAt(index).day}/${counter.historyCounter.keys.elementAt(index).month}/${counter.historyCounter.keys.elementAt(index).year} - ${counter.historyCounter.keys.elementAt(index).hour.toString().padLeft(2, '0')}:${counter.historyCounter.keys.elementAt(index).minute.toString().padLeft(2, '0')}",
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}


