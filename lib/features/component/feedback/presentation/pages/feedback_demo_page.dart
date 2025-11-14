import 'package:flutter/material.dart';
import 'package:zhuque_flutter_demo/core/constants/app_colors.dart';

/// 反馈组件演示页面
class FeedbackDemoPage extends StatefulWidget {
  const FeedbackDemoPage({super.key});

  @override
  State<FeedbackDemoPage> createState() => _FeedbackDemoPageState();
}

class _FeedbackDemoPageState extends State<FeedbackDemoPage> {
  bool _showNotification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('提示'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, '消息提示'),
            const SizedBox(height: 16),
            _buildMessageTips(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '通知提醒'),
            const SizedBox(height: 16),
            _buildNotificationTips(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '对话框'),
            const SizedBox(height: 16),
            _buildDialogTips(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '确认框'),
            const SizedBox(height: 16),
            _buildConfirmDialogTips(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '操作反馈'),
            const SizedBox(height: 16),
            _buildActionFeedback(context),
            const SizedBox(height: 32),

            _buildSectionTitle(context, '状态提示'),
            const SizedBox(height: 16),
            _buildStatusTips(context),
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

  Widget _buildMessageTips(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础消息提示'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('这是一条普通消息'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('普通消息'),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('操作成功！'),
                    backgroundColor: AppColors.success,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.success,
              ),
              child: const Text('成功消息'),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('操作失败！'),
                    backgroundColor: AppColors.danger,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.danger,
              ),
              child: const Text('错误消息'),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('请注意！'),
                    backgroundColor: AppColors.warning,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.warning,
              ),
              child: const Text('警告消息'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('带操作的消息'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('是否撤销此操作？'),
                    action: SnackBarAction(
                      label: '撤销',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('已撤销')),
                        );
                      },
                    ),
                    duration: const Duration(seconds: 3),
                  ),
                );
              },
              child: const Text('可撤销消息'),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('正在加载...'),
                    action: SnackBarAction(
                      label: '取消',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('已取消')),
                        );
                      },
                    ),
                    duration: const Duration(seconds: 3),
                  ),
                );
              },
              child: const Text('可取消消息'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('自定义位置消息'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('顶部消息'),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.only(top: 50),
                  ),
                );
              },
              child: const Text('顶部消息'),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('底部消息（默认）'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              child: const Text('底部消息'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNotificationTips(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础通知'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showNotification = !_showNotification;
                });
              },
              child: const Text('显示通知'),
            ),
            ElevatedButton(
              onPressed: () {
                // 模拟清除通知
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('通知已清除')),
                );
              },
              child: const Text('清除通知'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('通知徽章'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNotificationBadge(Icons.notifications, '消息', 5, Colors.red),
            _buildNotificationBadge(Icons.mail, '邮件', 12, Colors.blue),
            _buildNotificationBadge(Icons.shopping_cart, '购物车', 3, Colors.green),
          ],
        ),
        const SizedBox(height: 16),
        const Text('通知列表'),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              _buildNotificationItem(
                Icons.info,
                '系统通知',
                '系统将于今晚进行维护',
                '2分钟前',
                Colors.blue,
              ),
              const Divider(height: 1),
              _buildNotificationItem(
                Icons.warning,
                '安全提醒',
                '检测到异常登录',
                '5分钟前',
                Colors.orange,
              ),
              const Divider(height: 1),
              _buildNotificationItem(
                Icons.check_circle,
                '操作成功',
                '订单支付成功',
                '10分钟前',
                Colors.green,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDialogTips(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('基础对话框'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('提示'),
                      content: const Text('这是一个基础对话框'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('确定'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('基础对话框'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('自定义对话框'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.info,
                              size: 30,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text('这是一个自定义样式的对话框'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('取消'),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('确定'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('自定义对话框'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('输入对话框'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                final controller = TextEditingController();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('输入信息'),
                      content: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          labelText: '请输入内容',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('取消'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('输入了: ${controller.text}')),
                            );
                          },
                          child: const Text('确定'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('输入对话框'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: const Text('选择操作'),
                      children: [
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('选择了选项1')),
                            );
                          },
                          child: const Text('选项1'),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('选择了选项2')),
                            );
                          },
                          child: const Text('选项2'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('选择对话框'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildConfirmDialogTips(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('确认操作'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('确认删除'),
                      content: const Text('确定要删除这个项目吗？此操作不可恢复。'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('取消'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('已删除')),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.danger,
                          ),
                          child: const Text('删除'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('删除确认'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('退出确认'),
                      content: const Text('确定要退出应用吗？未保存的数据将会丢失。'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('取消'),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('退出'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('退出确认'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('危险操作确认'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('危险操作'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: AppColors.danger.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.warning,
                              size: 30,
                              color: AppColors.danger,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            '此操作将永久删除数据，请谨慎操作！',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('取消'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('操作已执行')),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.danger,
                          ),
                          child: const Text('确认执行'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('危险操作'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionFeedback(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('操作反馈'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                // 模拟成功操作
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.white),
                        SizedBox(width: 8),
                        Text('操作成功'),
                      ],
                    ),
                    backgroundColor: AppColors.success,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('成功反馈'),
            ),
            ElevatedButton(
              onPressed: () {
                // 模拟失败操作
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Row(
                      children: [
                        Icon(Icons.error, color: Colors.white),
                        SizedBox(width: 8),
                        Text('操作失败'),
                      ],
                    ),
                    backgroundColor: AppColors.danger,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('失败反馈'),
            ),
            ElevatedButton(
              onPressed: () {
                // 模拟处理中
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text('处理中...'),
                      ],
                    ),
                    backgroundColor: AppColors.info,
                    duration: const Duration(seconds: 3),
                  ),
                );
              },
              child: const Text('处理中'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('表单验证反馈'),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: '邮箱地址',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: Icon(Icons.check_circle, color: AppColors.success),
                    helperText: '请输入有效的邮箱地址',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: '手机号码',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                    suffixIcon: Icon(Icons.error, color: AppColors.danger),
                    errorText: '请输入有效的手机号码',
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.info, color: AppColors.info, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '表单验证提示信息',
                        style: TextStyle(
                          color: AppColors.info,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusTips(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('状态指示器'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatusIndicator('在线', Colors.green),
            _buildStatusIndicator('忙碌', Colors.orange),
            _buildStatusIndicator('离线', Colors.grey),
            _buildStatusIndicator('错误', Colors.red),
          ],
        ),
        const SizedBox(height: 16),
        const Text('徽标提示'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBadge('新', Colors.red, 16),
            _buildBadge('热', Colors.orange, 16),
            _buildBadge('推荐', Colors.blue, 20),
            _buildBadge('VIP', Colors.purple, 18),
          ],
        ),
        const SizedBox(height: 16),
        const Text('角标提示'),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildCornerBadge(Icons.home, 5, Colors.red),
            _buildCornerBadge(Icons.mail, 12, Colors.blue),
            _buildCornerBadge(Icons.shopping_cart, 99, Colors.green),
            _buildCornerBadge(Icons.notifications, 3, Colors.orange),
          ],
        ),
      ],
    );
  }

  Widget _buildNotificationBadge(IconData icon, String label, int count, Color color) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            if (count > 0)
              Positioned(
                right: -4,
                top: -4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                  child: Center(
                    child: Text(
                      count.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildNotificationItem(IconData icon, String title, String content, String time, Color color) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(title),
      subtitle: Text(content),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          if (title.contains('安全') || title.contains('异常'))
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.danger,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                '重要',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStatusIndicator(String text, Color color) {
    return Column(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 4),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildBadge(String text, Color color, double size) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(size / 2),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: size * 0.6,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildCornerBadge(IconData icon, int count, Color color) {
    return Stack(
      children: [
        Icon(icon, size: 32, color: Colors.grey),
        if (count > 0)
          Positioned(
            right: -4,
            top: -4,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
              child: Center(
                child: Text(
                  count > 99 ? '99+' : count.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}