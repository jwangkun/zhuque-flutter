import 'package:flutter/material.dart';
import 'package:zhuque_flutter_demo/core/constants/app_colors.dart';

class VerifyCodeDemoPage extends StatefulWidget {
  const VerifyCodeDemoPage({Key? key}) : super(key: key);

  @override
  State<VerifyCodeDemoPage> createState() => _VerifyCodeDemoPageState();
}

class _VerifyCodeDemoPageState extends State<VerifyCodeDemoPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isPhoneValid = false;
  bool _isEmailValid = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VerifyCode 验证码'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('基础用法'),
            const SizedBox(height: 16),
            const Text('手机号验证码'),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: '请输入手机号',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _isPhoneValid = value.length == 11;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 12),
                TnVerifyCodeButton(
                  onPressed: _isPhoneValid
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('验证码已发送')),
                          );
                        }
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('邮箱验证码'),
            const SizedBox(height: 16),
            const Text('邮箱验证码'),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: '请输入邮箱地址',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _isEmailValid = value.contains('@') && value.contains('.');
                      });
                    },
                  ),
                ),
                const SizedBox(width: 12),
                TnVerifyCodeButton(
                  onPressed: _isEmailValid
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('验证码已发送到邮箱')),
                          );
                        }
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('自定义时长'),
            const SizedBox(height: 16),
            const Text('自定义60秒倒计时'),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '请输入手机号',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                TnVerifyCodeButton(
                  countdown: 60,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('60秒验证码已发送')),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('自定义文案'),
            const SizedBox(height: 16),
            const Text('自定义倒计时文案'),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '请输入手机号',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                TnVerifyCodeButton(
                  text: '获取验证码',
                  countingText: '重新获取',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('验证码已发送')),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('自动开始'),
            const SizedBox(height: 16),
            const Text('页面加载后自动开始倒计时'),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '请输入手机号',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                TnVerifyCodeButton(
                  autoStart: true,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('自动开始倒计时')),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('样式自定义'),
            const SizedBox(height: 16),
            const Text('自定义按钮样式'),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '请输入手机号',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                TnVerifyCodeButton(
                  text: '发送',
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('自定义样式验证码已发送')),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('状态管理'),
            const SizedBox(height: 16),
            const Text('按钮状态管理'),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '请输入手机号',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                TnVerifyCodeButton(
                  onPressed: null, // 禁用状态
                  text: '已禁用',
                ),
              ],
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('完整示例'),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.gray1,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.gray3),
              ),
              child: Column(
                children: [
                  const Text(
                    '手机号登录',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: '请输入手机号',
                      prefixIcon: const Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '请输入验证码',
                            prefixIcon: const Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 12),
                      TnVerifyCodeButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('验证码已发送，请注意查收')),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('登录成功')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('登录'),
                    ),
                  ),
                ],
              ),
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

// 验证码按钮组件实现
class TnVerifyCodeButton extends StatefulWidget {
  final int countdown;
  final String text;
  final String countingText;
  final VoidCallback? onPressed;
  final bool autoStart;
  final ButtonStyle? style;

  const TnVerifyCodeButton({
    Key? key,
    this.countdown = 30,
    this.text = '获取验证码',
    this.countingText = '重新发送',
    this.onPressed,
    this.autoStart = false,
    this.style,
  }) : super(key: key);

  @override
  State<TnVerifyCodeButton> createState() => _TnVerifyCodeButtonState();
}

class _TnVerifyCodeButtonState extends State<TnVerifyCodeButton> {
  late int _countdown;
  bool _isCounting = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _countdown = widget.countdown;

    if (widget.autoStart) {
      _startCountdown();
    }
  }

  @override
  void dispose() {
    if (_isCounting) {
      _timer.cancel();
    }
    super.dispose();
  }

  void _startCountdown() {
    if (widget.onPressed != null) {
      widget.onPressed!();
    }

    setState(() {
      _isCounting = true;
      _countdown = widget.countdown;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _countdown--;
        });

        if (_countdown <= 0) {
          _timer.cancel();
          setState(() {
            _isCounting = false;
            _countdown = widget.countdown;
          });
        }
      }
    });
  }

  String _getButtonText() {
    if (_isCounting) {
      return '${_countdown}s';
    }
    return widget.text;
  }

  bool _isButtonEnabled() {
    return widget.onPressed != null && !_isCounting;
  }

  @override
  Widget build(BuildContext context) {
    final defaultStyle = ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      minimumSize: const Size(100, 40),
    );

    final buttonStyle = widget.style ?? defaultStyle;

    return SizedBox(
      width: 100,
      child: ElevatedButton(
        onPressed: _isButtonEnabled() ? _startCountdown : null,
        style: buttonStyle,
        child: Text(
          _getButtonText(),
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}

// 简化的倒计时按钮实现（用于快速集成）
class SimpleVerifyCodeButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final ButtonStyle? style;

  const SimpleVerifyCodeButton({
    Key? key,
    this.onPressed,
    this.text = '获取验证码',
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style ??
            ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
        child: Text(text),
      ),
    );
  }
}