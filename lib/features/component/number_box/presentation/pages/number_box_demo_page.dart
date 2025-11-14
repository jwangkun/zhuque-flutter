import 'package:flutter/material.dart';
import 'package:tuniao/core/theme/app_colors.dart';

class NumberBoxDemoPage extends StatefulWidget {
  const NumberBoxDemoPage({Key? key}) : super(key: key);

  @override
  State<NumberBoxDemoPage> createState() => _NumberBoxDemoPageState();
}

class _NumberBoxDemoPageState extends State<NumberBoxDemoPage> {
  double _value1 = 0;
  double _value2 = 5;
  double _value3 = 1;
  double _value4 = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NumberBox 步进器'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('基础用法'),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('基础步进器：'),
                const SizedBox(width: 16),
                TnNumberBox(
                  value: _value1,
                  onChanged: (value) => setState(() => _value1 = value),
                ),
                const SizedBox(width: 16),
                Text('当前值: ${_value1.toStringAsFixed(0)}'),
              ],
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('限制范围'),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('0-10范围：'),
                const SizedBox(width: 16),
                TnNumberBox(
                  value: _value2,
                  min: 0,
                  max: 10,
                  step: 0.5,
                  onChanged: (value) => setState(() => _value2 = value),
                ),
                const SizedBox(width: 16),
                Text('当前值: ${_value2.toStringAsFixed(1)}'),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              '限制在0-10之间，步长0.5',
              style: TextStyle(color: AppColors.gray6, fontSize: 12),
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('自定义步长'),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('步长为5：'),
                const SizedBox(width: 16),
                TnNumberBox(
                  value: _value3,
                  min: 0,
                  max: 100,
                  step: 5,
                  onChanged: (value) => setState(() => _value3 = value),
                ),
                const SizedBox(width: 16),
                Text('当前值: ${_value3.toStringAsFixed(0)}'),
              ],
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('整数模式'),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('整数步进：'),
                const SizedBox(width: 16),
                TnNumberBox(
                  value: _value4,
                  min: 0,
                  max: 100,
                  step: 1,
                  integerOnly: true,
                  onChanged: (value) => setState(() => _value4 = value),
                ),
                const SizedBox(width: 16),
                Text('当前值: ${_value4.toStringAsFixed(0)}'),
              ],
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('自定义样式'),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('自定义图标：'),
                const SizedBox(width: 16),
                TnNumberBox(
                  value: 5,
                  minusIcon: const Icon(Icons.remove, color: Colors.white, size: 20),
                  plusIcon: const Icon(Icons.add, color: Colors.white, size: 20),
                  buttonWidth: 40,
                  buttonHeight: 40,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text('圆角样式：'),
                const SizedBox(width: 16),
                TnNumberBox(
                  value: 3,
                  buttonWidth: 36,
                  buttonHeight: 36,
                  inputDecoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: AppColors.gray1,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('禁用状态'),
            const SizedBox(height: 16),
            const Row(
              children: [
                Text('禁用状态：'),
                SizedBox(width: 16),
                TnNumberBox(
                  value: 5,
                  disabled: true,
                ),
              ],
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('小数精度'),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('两位小数：'),
                const SizedBox(width: 16),
                TnNumberBox(
                  value: 3.14,
                  min: 0,
                  max: 10,
                  step: 0.01,
                  decimalPlaces: 2,
                  onChanged: (value) => debugPrint('当前值: $value'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.gray8,
      ),
    );
  }
}

// 步进器组件实现
class TnNumberBox extends StatefulWidget {
  final double value;
  final double min;
  final double max;
  final double step;
  final ValueChanged<double>? onChanged;
  final bool disabled;
  final Widget? minusIcon;
  final Widget? plusIcon;
  final double buttonWidth;
  final double buttonHeight;
  final InputDecoration? inputDecoration;
  final TextStyle? textStyle;
  final bool integerOnly;
  final int? decimalPlaces;

  const TnNumberBox({
    Key? key,
    this.value = 0,
    this.min = double.negativeInfinity,
    this.max = double.infinity,
    this.step = 1,
    this.onChanged,
    this.disabled = false,
    this.minusIcon,
    this.plusIcon,
    this.buttonWidth = 32,
    this.buttonHeight = 32,
    this.inputDecoration,
    this.textStyle,
    this.integerOnly = false,
    this.decimalPlaces,
  }) : super(key: key);

  @override
  State<TnNumberBox> createState() => _TnNumberBoxState();
}

class _TnNumberBoxState extends State<TnNumberBox> {
  late TextEditingController _controller;
  late double _currentValue;
  bool _isMinusEnabled = true;
  bool _isPlusEnabled = true;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
    _controller = TextEditingController(
      text: _formatValue(_currentValue),
    );
    _updateButtonStates();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _formatValue(double value) {
    if (widget.integerOnly) {
      return value.toInt().toString();
    }
    if (widget.decimalPlaces != null) {
      return value.toStringAsFixed(widget.decimalPlaces!);
    }
    return value.toString();
  }

  void _updateButtonStates() {
    setState(() {
      _isMinusEnabled = _currentValue > widget.min;
      _isPlusEnabled = _currentValue < widget.max;
    });
  }

  void _handleMinus() {
    if (widget.disabled || !_isMinusEnabled) return;

    final newValue = _currentValue - widget.step;
    if (newValue >= widget.min) {
      _updateValue(newValue);
    }
  }

  void _handlePlus() {
    if (widget.disabled || !_isPlusEnabled) return;

    final newValue = _currentValue + widget.step;
    if (newValue <= widget.max) {
      _updateValue(newValue);
    }
  }

  void _updateValue(double newValue) {
    setState(() {
      _currentValue = newValue;
      _controller.text = _formatValue(_currentValue);
      _updateButtonStates();
    });
    widget.onChanged?.call(_currentValue);
  }

  void _handleTextChanged(String value) {
    if (value.isEmpty) return;

    final parsedValue = double.tryParse(value);
    if (parsedValue != null) {
      if (parsedValue >= widget.min && parsedValue <= widget.max) {
        _currentValue = parsedValue;
        _updateButtonStates();
        widget.onChanged?.call(_currentValue);
      }
    }
  }

  Color _getButtonColor(bool enabled) {
    if (widget.disabled || !enabled) {
      return AppColors.gray4;
    }
    return AppColors.primary;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 减号按钮
        GestureDetector(
          onTap: _handleMinus,
          child: Container(
            width: widget.buttonWidth,
            height: widget.buttonHeight,
            decoration: BoxDecoration(
              color: _getButtonColor(_isMinusEnabled),
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(4)),
            ),
            child: widget.minusIcon ??
                const Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 16,
                ),
          ),
        ),

        // 输入框
        Container(
          width: 80,
          height: widget.buttonHeight,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: AppColors.gray4),
              bottom: BorderSide(color: AppColors.gray4),
            ),
          ),
          child: TextField(
            controller: _controller,
            enabled: !widget.disabled,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: widget.inputDecoration ??
                InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                ),
            style: widget.textStyle ?? Theme.of(context).textTheme.bodyMedium,
            onChanged: _handleTextChanged,
          ),
        ),

        // 加号按钮
        GestureDetector(
          onTap: _handlePlus,
          child: Container(
            width: widget.buttonWidth,
            height: widget.buttonHeight,
            decoration: BoxDecoration(
              color: _getButtonColor(_isPlusEnabled),
              borderRadius: const BorderRadius.horizontal(right: Radius.circular(4)),
            ),
            child: widget.plusIcon ??
                const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 16,
                ),
          ),
        ),
      ],
    );
  }
}