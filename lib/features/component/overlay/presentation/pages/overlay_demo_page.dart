import 'package:flutter/material.dart';
import 'package:zhuque_flutter_demo/core/constants/app_colors.dart';

/// 弹出层组件演示页面
class OverlayDemoPage extends StatefulWidget {
  const OverlayDemoPage({super.key});

  @override
  State<OverlayDemoPage> createState() => _OverlayDemoPageState();
}

class _OverlayDemoPageState extends State<OverlayDemoPage> {
  String _selectedValue = '选项1';

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('弹出层'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, '模态框'),
            const SizedBox(height: 16),
            _buildModals(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '弹出菜单'),
            const SizedBox(height: 16),
            _buildPopupMenus(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '下拉选择'),
            const SizedBox(height: 16),
            _buildDropdownSelects(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '工具提示'),
            const SizedBox(height: 16),
            _buildTooltips(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '底部弹出层'),
            const SizedBox(height: 16),
            _buildBottomSheets(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '自定义弹出层'),
            const SizedBox(height: 16),
            _buildCustomOverlays(context),
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

  Widget _buildModals(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础模态框'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CircularProgressIndicator(),
                            const SizedBox(height: 16),
                            const Text('正在处理...'),
                            const SizedBox(height: 16),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('取消'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text('加载模态框'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: AppColors.success.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check_circle,
                                size: 30,
                                color: AppColors.success,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              '操作成功',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              '您的操作已成功完成',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('确定'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text('成功模态框'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('全屏模态框'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: const Text('全屏模态框'),
                        leading: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('这是一个全屏模态框'),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('关闭'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: const Text('全屏模态'),
            ),
            ElevatedButton(
              onPressed: () {
                showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: '关闭',
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return Center(
                      child: Container(
                        width: 300,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('自定义模态框'),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('关闭'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text('自定义模态'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPopupMenus(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础弹出菜单'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PopupMenuButton<String>(
              onSelected: (String value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('选择了: $value')),
                );
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: '选项1',
                    child: Text('选项1'),
                  ),
                  const PopupMenuItem<String>(
                    value: '选项2',
                    child: Text('选项2'),
                  ),
                  const PopupMenuItem<String>(
                    value: '选项3',
                    child: Text('选项3'),
                  ),
                ];
              },
              child: const ElevatedButton(
                onPressed: null,
                child: Text('弹出菜单'),
              ),
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              onSelected: (String value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('选择了: $value')),
                );
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: '编辑',
                    child: Row(
                      children: [
                        Icon(Icons.edit, size: 16),
                        SizedBox(width: 8),
                        Text('编辑'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: '删除',
                    child: Row(
                      children: [
                        Icon(Icons.delete, size: 16),
                        SizedBox(width: 8),
                        Text('删除'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: '分享',
                    child: Row(
                      children: [
                        Icon(Icons.share, size: 16),
                        SizedBox(width: 8),
                        Text('分享'),
                      ],
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('自定义弹出菜单'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                final RenderBox button = context.findRenderObject() as RenderBox;
                final RenderBox overlay = Navigator.of(context).overlay!.context.findRenderObject() as RenderBox;
                final RelativeRect position = RelativeRect.fromRect(
                  Rect.fromPoints(
                    button.localToGlobal(const Offset(0, 40), ancestor: overlay),
                    button.localToGlobal(button.size.bottomRight(Offset.zero) + const Offset(0, 40), ancestor: overlay),
                  ),
                  Offset.zero & overlay.size,
                );

                showMenu(
                  context: context,
                  position: position,
                  items: [
                    const PopupMenuItem<String>(
                      value: '选项1',
                      child: Text('选项1'),
                    ),
                    const PopupMenuItem<String>(
                      value: '选项2',
                      child: Text('选项2'),
                    ),
                    const PopupMenuItem<String>(
                      value: '选项3',
                      child: Text('选项3'),
                    ),
                  ],
                ).then((value) {
                  if (value != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('选择了: $value')),
                    );
                  }
                });
              },
              child: const Text('自定义位置'),
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          '选择操作',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ListTile(
                          leading: const Icon(Icons.edit),
                          title: const Text('编辑'),
                          onTap: () {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('选择了编辑')),
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.delete),
                          title: const Text('删除'),
                          onTap: () {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('选择了删除')),
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.share),
                          title: const Text('分享'),
                          onTap: () {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('选择了分享')),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                  },
                );
              },
              child: const Text('底部菜单'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDropdownSelects(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础下拉选择'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DropdownButton<String>(
              value: _selectedValue,
              items: ['选项1', '选项2', '选项3'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedValue = newValue!;
                });
              },
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: _selectedValue,
                underline: Container(),
                items: ['选项1', '选项2', '选项3'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedValue = newValue!;
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('下拉表单'),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: '选择城市',
                    border: OutlineInputBorder(),
                  ),
                  items: ['北京', '上海', '广州', '深圳'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('选择了: $newValue')),
                    );
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: '选择分类',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.category),
                  ),
                  items: ['分类1', '分类2', '分类3'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('选择了: $newValue')),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('自定义下拉'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: Container(
                        width: 200,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              '选择选项',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ...['选项1', '选项2', '选项3'].map((option) {
                              return ListTile(
                                title: Text(option),
                                onTap: () {
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('选择了: $option')),
                                  );
                                },
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text('自定义下拉'),
            ),
            ElevatedButton(
              onPressed: () {
                final RenderBox button = context.findRenderObject() as RenderBox;
                final RenderBox overlay = Navigator.of(context).overlay!.context.findRenderObject() as RenderBox;
                final RelativeRect position = RelativeRect.fromRect(
                  Rect.fromPoints(
                    button.localToGlobal(const Offset(0, 40), ancestor: overlay),
                    button.localToGlobal(button.size.bottomRight(Offset.zero) + const Offset(0, 40), ancestor: overlay),
                  ),
                  Offset.zero & overlay.size,
                );

                showMenu(
                  context: context,
                  position: position,
                  items: [
                    const PopupMenuItem<String>(
                      value: '红色',
                      child: Row(
                        children: [
                          Icon(Icons.circle, color: Colors.red, size: 16),
                          SizedBox(width: 8),
                          Text('红色'),
                        ],
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: '蓝色',
                      child: Row(
                        children: [
                          Icon(Icons.circle, color: Colors.blue, size: 16),
                          SizedBox(width: 8),
                          Text('蓝色'),
                        ],
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: '绿色',
                      child: Row(
                        children: [
                          Icon(Icons.circle, color: Colors.green, size: 16),
                          SizedBox(width: 8),
                          Text('绿色'),
                        ],
                      ),
                    ),
                  ],
                ).then((value) {
                  if (value != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('选择了: $value')),
                    );
                  }
                });
              },
              child: const Text('颜色选择'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTooltips(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础工具提示'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Tooltip(
              message: '这是一个工具提示',
              child: const ElevatedButton(
                onPressed: null,
                child: Text('悬停提示'),
              ),
            ),
            Tooltip(
              message: '顶部工具提示',
              preferBelow: false,
              child: const ElevatedButton(
                onPressed: null,
                child: Text('顶部提示'),
              ),
            ),
            Tooltip(
              message: '底部工具提示',
              preferBelow: true,
              child: const ElevatedButton(
                onPressed: null,
                child: Text('底部提示'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('自定义工具提示'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Tooltip(
              message: '彩色工具提示',
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              textStyle: const TextStyle(color: Colors.white),
              child: const ElevatedButton(
                onPressed: null,
                child: Text('彩色提示'),
              ),
            ),
            Tooltip(
              message: '长文本工具提示，可以显示更多的内容信息',
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(8),
              ),
              textStyle: const TextStyle(color: Colors.white),
              child: const ElevatedButton(
                onPressed: null,
                child: Text('长文本提示'),
              ),
            ),
            Tooltip(
              message: '图标工具提示',
              decoration: BoxDecoration(
                color: AppColors.success,
                borderRadius: BorderRadius.circular(8),
              ),
              textStyle: const TextStyle(color: Colors.white),
              child: const IconButton(
                icon: Icon(Icons.info),
                onPressed: null,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('富文本工具提示'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Tooltip(
              richMessage: WidgetSpan(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '详细信息',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '这里可以显示更详细的内容，包括多行文本。',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: AppColors.info,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const ElevatedButton(
                onPressed: null,
                child: Text('富文本提示'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomSheets(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础底部弹出层'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            '选择操作',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ListTile(
                            leading: const Icon(Icons.edit),
                            title: const Text('编辑'),
                            onTap: () {
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('选择了编辑')),
                              );
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.delete),
                            title: const Text('删除'),
                            onTap: () {
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('选择了删除')),
                              );
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.share),
                            title: const Text('分享'),
                            onTap: () {
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('选择了分享')),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text('基础底部'),
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 40,
                            height: 4,
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const Text(
                            '自定义样式',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            height: 100,
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.image,
                                size: 48,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('关闭'),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text('自定义底部'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('持久底部弹出层'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                showBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, -5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            '持久底部弹出层',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text('这个弹出层不会自动关闭，需要手动关闭'),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('关闭'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text('持久底部'),
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return DraggableScrollableSheet(
                      initialChildSize: 0.5,
                      minChildSize: 0.2,
                      maxChildSize: 0.9,
                      builder: (context, scrollController) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 40,
                                height: 4,
                                margin: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              const Text(
                                '可拖拽底部弹出层',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  controller: scrollController,
                                  itemCount: 20,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text('项目 ${index + 1}'),
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('选择了项目 ${index + 1}')),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: const Text('可拖拽底部'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCustomOverlays(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('自定义Overlay'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                final overlay = Overlay.of(context);
                OverlayEntry? overlayEntry;
                overlayEntry = OverlayEntry(
                  builder: (context) => Positioned(
                    top: 100,
                    left: 50,
                    right: 50,
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('自定义Overlay'),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                overlayEntry?.remove();
                              },
                              child: const Text('关闭'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
                overlay.insert(overlayEntry);
              },
              child: const Text('自定义Overlay'),
            ),
            ElevatedButton(
              onPressed: () {
                showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: '关闭',
                  barrierColor: Colors.black.withOpacity(0.5),
                  transitionDuration: const Duration(milliseconds: 300),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return Center(
                      child: ScaleTransition(
                        scale: animation,
                        child: Container(
                          width: 250,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('动画弹出层'),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('关闭'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text('动画弹出层'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('浮动操作按钮'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('点击了FAB')),
                );
              },
              child: const Icon(Icons.add),
            ),
            FloatingActionButton.extended(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('点击了扩展FAB')),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('创建'),
            ),
            FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('点击了迷你FAB')),
                );
              },
              mini: true,
              child: const Icon(Icons.add),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('弹出层定位'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                final overlay = Overlay.of(context);
                OverlayEntry? overlayEntry;
                overlayEntry = OverlayEntry(
                  builder: (context) => Positioned(
                    top: MediaQuery.of(context).size.height / 2 - 50,
                    left: MediaQuery.of(context).size.width / 2 - 100,
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        width: 200,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 15,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('屏幕中心'),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                  overlayEntry?.remove();
                                },
                                child: const Text('关闭'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
                overlay.insert(overlayEntry);
              },
              child: const Text('屏幕中心'),
            ),
            ElevatedButton(
              onPressed: () {
                final overlay = Overlay.of(context);
                final overlayEntry = OverlayEntry(
                  builder: (context) => Positioned(
                    top: 50,
                    right: 20,
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.danger,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.warning, color: Colors.white, size: 16),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                '右上角提示',
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
                overlay.insert(overlayEntry);

                // 3秒后自动关闭
                Future.delayed(const Duration(seconds: 3), () {
                  overlayEntry.remove();
                });
              },
              child: const Text('右上角提示'),
            ),
          ],
        ),
      ],
    );
  }
}