import 'package:flutter/material.dart';
import 'package:awwao/data/learning_content.dart';

class BanglaNamtaScreen extends StatefulWidget {
  const BanglaNamtaScreen({super.key});

  @override
  State<BanglaNamtaScreen> createState() => _BanglaNamtaScreenState();
}

class _BanglaNamtaScreenState extends State<BanglaNamtaScreen>
    with TickerProviderStateMixin {
  final data = BanglaLearningData.namta;

  int _selectedNumber = 1;
  late AnimationController _transitionController;

  @override
  void initState() {
    super.initState();
    _transitionController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _transitionController.forward();
  }

  @override
  void dispose() {
    _transitionController.dispose();
    super.dispose();
  }

  void _selectNumber(int number) {
    setState(() {
      _selectedNumber = number;
      _transitionController.reset();
      _transitionController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color.fromARGB(255, 0, 0, 0),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'নামতা',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        // centerTitle: true,
        backgroundColor: const Color(0xFF3F51B5),
        elevation: 2,
      ),
      body: Column(
        children: [
          _buildNumberSelector(),
          _buildTableHeader(),
          _buildNamtaTable(),
        ],
      ),
    );
  }

  Widget _buildNumberSelector() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        itemCount: 10,
        itemBuilder: (context, index) {
          final number = index + 1;
          final isSelected = _selectedNumber == number;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => _selectNumber(number),
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 52,
                  decoration: BoxDecoration(
                    color:
                        isSelected
                            ? const Color(0xFF3F51B5)
                            : const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color:
                          isSelected
                              ? const Color(0xFF3F51B5)
                              : const Color(0xFFE0E0E0),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      _getBanglaNumber(number),
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color:
                            isSelected ? Colors.white : const Color(0xFF424242),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String _getBanglaNumber(int number) {
    Map<int, String> banglaDigits = {
      1: '১',
      2: '২',
      3: '৩',
      4: '৪',
      5: '৫',
      6: '৬',
      7: '৭',
      8: '৮',
      9: '৯',
      10: '১০',
    };

    return banglaDigits[number]!;
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: const Color(0xFFE8EAF6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF3F51B5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              _getBanglaNumber(_selectedNumber),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            'এর নামতা',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF303F9F),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNamtaTable() {
    final namtaItems = data[_selectedNumber]!;

    return Expanded(
      child: FadeTransition(
        opacity: _transitionController,
        child: Container(
          color: Colors.white,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: namtaItems.length,
            itemBuilder: (context, index) {
              return _buildNamtaRow(namtaItems[index], index);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildNamtaRow(String item, int index) {
    // Parse the multiplication string to get parts
    final parts = item.split('=');
    final equation = parts[0].trim();
    final result = parts[1].trim();

    return Container(
      decoration: BoxDecoration(
        color: index % 2 == 0 ? Colors.white : const Color(0xFFF5F7FF),
        border: const Border(
          bottom: BorderSide(color: Color(0xFFEEEEEE), width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          // Row number
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFF3F51B5),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
              child: Text(
                _getBanglaNumber(index + 1),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Equation
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  equation,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF424242),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  '=',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF424242),
                  ),
                ),
                const SizedBox(width: 8),

                // Result
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3F51B5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    result,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Audio button
          IconButton(
            icon: const Icon(
              Icons.volume_up_outlined,
              color: Color(0xFF3F51B5),
            ),
            onPressed: () {
              // Audio feature for pronunciation
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('উচ্চারণ: $item')));
            },
          ),
        ],
      ),
    );
  }
}
