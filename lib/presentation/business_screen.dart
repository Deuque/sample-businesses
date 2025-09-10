import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_bookmarks/domain/business_model.dart';
import 'package:sample_bookmarks/presentation/business_notifier.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchList();
    });
  }

  void fetchList() {
    context.read<BusinessNotifier>().fetchBusinessList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My business')),
      body: Selector<BusinessNotifier, ViewState<List<BusinessModel>>>(
        selector: (_, notifier) => notifier.itemsState,
        builder: (context, state, _) {
          return switch (state) {
            ViewLoading() => Center(child: CircularProgressIndicator()),
            ViewError() => _ErrorCard(onRefresh: fetchList),
            ViewSuccess() => _BusinessList(items: state.data),
          };
        },
      ),
    );
  }
}

class _ErrorCard extends StatelessWidget {
  final VoidCallback onRefresh;

  const _ErrorCard({super.key, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('An error occurred'),
          const SizedBox(height: 20),
          OutlinedButton(onPressed: onRefresh, child: Text('Try again')),
        ],
      ),
    );
  }
}

class _BusinessList extends StatelessWidget {
  final List<BusinessModel> items;

  const _BusinessList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(child: Text('You have no businesses'));
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
      itemBuilder: (_, i) {
        final item = items[i];
        return _BusinessCard(business: item);
      },
      itemCount: items.length,
    );
  }
}

class _BusinessCard extends StatelessWidget {
  final BusinessModel business;

  const _BusinessCard({super.key, required this.business});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(business.name),
      subtitle: Text('${business.location} - ${business.contact}'),
      trailing: Icon(Icons.keyboard_arrow_right),
    );
  }
}
