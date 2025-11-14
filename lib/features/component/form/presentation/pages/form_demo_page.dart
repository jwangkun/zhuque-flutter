import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zhuque_flutter_demo/core/constants/app_colors.dart';

/// 表单演示组件
class FormDemoPage extends ConsumerStatefulWidget {
  const FormDemoPage({super.key});

  @override
  ConsumerState<FormDemoPage> createState() => _FormDemoPageState();
}

class _FormDemoPageState extends ConsumerState<FormDemoPage> {
  bool _obscurePassword = true;
  String _selectedRadio = 'option1';
  List<String> _selectedCheckboxes = ['option1'];
  double _sliderValue = 50.0;
  RangeValues _rangeValues = const RangeValues(20, 80);
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('表单'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, '基础输入框'),
            const SizedBox(height: 16),
            _buildBasicInputs(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '输入框状态'),
            const SizedBox(height: 16),
            _buildInputStates(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '输入框类型'),
            const SizedBox(height: 16),
            _buildInputTypes(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '选择器'),
            const SizedBox(height: 16),
            _buildSelectors(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '开关和复选框'),
            const SizedBox(height: 16),
            _buildSwitchesAndCheckboxes(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '表单验证'),
            const SizedBox(height: 16),
            _buildFormValidation(context, ref),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '高级组件'),
            const SizedBox(height: 16),
            _buildAdvancedComponents(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '表单布局'),
            const SizedBox(height: 16),
            _buildFormLayouts(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
    );
  }

  Widget _buildBasicInputs(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('默认输入框'),
        const SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
            hintText: '请输入内容',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('带标签的输入框'),
        const SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
            labelText: '用户名',
            hintText: '请输入用户名',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            prefixIcon: const Icon(Icons.person),
          ),
        ),
        const SizedBox(height: 16),
        const Text('带前缀后缀的输入框'),
        const SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
            hintText: '请输入网址',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            prefixText: 'https://',
            suffixText: '.com',
          ),
        ),
        const SizedBox(height: 16),
        const Text('多行文本输入框'),
        const SizedBox(height: 12),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: '请输入多行文本',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            alignLabelWithHint: true,
          ),
        ),
      ],
    );
  }

  Widget _buildInputStates(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('正常状态'),
        const SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
            labelText: '正常输入框',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('聚焦状态'),
        const SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
            labelText: '聚焦输入框',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('禁用状态'),
        const SizedBox(height: 12),
        TextField(
          enabled: false,
          decoration: InputDecoration(
            labelText: '禁用输入框',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: Colors.grey.shade100,
          ),
        ),
        const SizedBox(height: 16),
        const Text('错误状态'),
        const SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
            labelText: '错误输入框',
            errorText: '请输入有效的内容',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.danger, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInputTypes(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('密码输入框'),
        const SizedBox(height: 12),
        TextField(
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            labelText: '密码',
            hintText: '请输入密码',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('数字输入框'),
        const SizedBox(height: 12),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: '年龄',
            hintText: '请输入年龄',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            prefixIcon: const Icon(Icons.numbers),
          ),
        ),
        const SizedBox(height: 16),
        const Text('邮箱输入框'),
        const SizedBox(height: 12),
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: '邮箱',
            hintText: '请输入邮箱地址',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            prefixIcon: const Icon(Icons.email),
          ),
        ),
        const SizedBox(height: 16),
        const Text('电话输入框'),
        const SizedBox(height: 12),
        TextField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: '电话',
            hintText: '请输入电话号码',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            prefixIcon: const Icon(Icons.phone),
          ),
        ),
        const SizedBox(height: 16),
        const Text('搜索输入框'),
        const SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
            hintText: '搜索',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Colors.grey.shade50,
          ),
        ),
      ],
    );
  }

  Widget _buildSelectors(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('下拉选择'),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: '选择城市',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          items: ['北京', '上海', '广州', '深圳'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {},
        ),
        const SizedBox(height: 16),
        const Text('日期选择'),
        const SizedBox(height: 12),
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: '选择日期',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            prefixIcon: const Icon(Icons.calendar_today),
            suffixIcon: const Icon(Icons.arrow_drop_down),
          ),
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2025),
            );
          },
        ),
        const SizedBox(height: 16),
        const Text('时间选择'),
        const SizedBox(height: 12),
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: '选择时间',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            prefixIcon: const Icon(Icons.access_time),
            suffixIcon: const Icon(Icons.arrow_drop_down),
          ),
          onTap: () async {
            final TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
          },
        ),
        const SizedBox(height: 16),
        const Text('滑块'),
        const SizedBox(height: 12),
        Column(
          children: [
            Slider(
              value: _sliderValue,
              min: 0,
              max: 100,
              divisions: 10,
              label: _sliderValue.toStringAsFixed(0),
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('0'),
                Expanded(
                  child: Slider(
                    value: 30,
                    min: 0,
                    max: 100,
                    onChanged: (double value) {},
                  ),
                ),
                const Text('100'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSwitchesAndCheckboxes(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('开关'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Switch(
                  value: true,
                  onChanged: (bool value) {},
                ),
                const Text('开启'),
              ],
            ),
            Row(
              children: [
                Switch(
                  value: false,
                  onChanged: (bool value) {},
                ),
                const Text('关闭'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('复选框'),
        const SizedBox(height: 12),
        Column(
          children: [
            CheckboxListTile(
              title: const Text('选项 1'),
              value: true,
              onChanged: (bool? value) {},
            ),
            CheckboxListTile(
              title: const Text('选项 2'),
              value: false,
              onChanged: (bool? value) {},
            ),
            CheckboxListTile(
              title: const Text('选项 3 (禁用)'),
              value: false,
              onChanged: null,
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('单选框'),
        const SizedBox(height: 12),
        Column(
          children: [
            RadioListTile<String>(
              title: const Text('选项 A'),
              value: 'A',
              groupValue: 'A',
              onChanged: (String? value) {},
            ),
            RadioListTile<String>(
              title: const Text('选项 B'),
              value: 'B',
              groupValue: 'A',
              onChanged: (String? value) {},
            ),
            RadioListTile<String>(
              title: const Text('选项 C (禁用)'),
              value: 'C',
              groupValue: 'A',
              onChanged: null,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFormValidation(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('完整表单示例'),
        const SizedBox(height: 12),
        Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: '用户名 *',
                    hintText: '请输入用户名',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: '密码 *',
                    hintText: '请输入密码',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: '邮箱 *',
                    hintText: '请输入邮箱地址',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: '城市',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  items: ['北京', '上海', '广州', '深圳'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {},
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (bool? value) {},
                    ),
                    const Text('我同意用户协议'),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('表单提交成功')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('提交'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAdvancedComponents(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('范围滑块'),
        const SizedBox(height: 12),
        Column(
          children: [
            RangeSlider(
              values: _rangeValues,
              min: 0,
              max: 100,
              divisions: 20,
              labels: RangeLabels(
                _rangeValues.start.round().toString(),
                _rangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _rangeValues = values;
                });
              },
            ),
            Text('范围: ${_rangeValues.start.toStringAsFixed(0)} - ${_rangeValues.end.toStringAsFixed(0)}'),
          ],
        ),
        const SizedBox(height: 16),
        const Text('日期时间选择'),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: '选择日期',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.calendar_today),
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                ),
                controller: TextEditingController(
                  text: _selectedDate?.toString().substring(0, 10) ?? '未选择',
                ),
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2025),
                  );
                  if (picked != null) {
                    setState(() {
                      _selectedDate = picked;
                    });
                  }
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: '选择时间',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.access_time),
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                ),
                controller: TextEditingController(
                  text: _selectedTime?.format(context) ?? '未选择',
                ),
                onTap: () async {
                  final TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: _selectedTime ?? TimeOfDay.now(),
                  );
                  if (picked != null) {
                    setState(() {
                      _selectedTime = picked;
                    });
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('文件上传'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade50,
          ),
          child: Column(
            children: [
              const Icon(Icons.cloud_upload, size: 48, color: Colors.grey),
              const SizedBox(height: 8),
              const Text(
                '点击或拖拽文件到此处上传',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.file_upload),
                label: const Text('选择文件'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('评分组件'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Text('星级评分'),
                const SizedBox(height: 8),
                Row(
                  children: List.generate(5, (index) {
                    return IconButton(
                      icon: const Icon(Icons.star, color: Colors.amber),
                      onPressed: () {},
                      iconSize: 24,
                    );
                  }),
                ),
              ],
            ),
            Column(
              children: [
                const Text('数字评分'),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    '4.5分',
                    style: TextStyle(
                      color: AppColors.success,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFormLayouts(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('水平布局'),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: '姓',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: '名',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: '国家',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        items: ['中国', '美国', '日本'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {},
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: '邮编',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('分组布局'),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: const Text(
                  '个人信息',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: '姓名',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        labelText: '电话',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                ),
                child: const Text(
                  '账户信息',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: '用户名',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        labelText: '密码',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('响应式布局'),
        const SizedBox(height: 12),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: '邮箱',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: '电话',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: '邮箱',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: '电话',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}