import 'package:flutter/material.dart';
import 'package:shego/shared/theme/app_colors.dart';

class LogoAnimationScreen extends StatefulWidget {
  const LogoAnimationScreen({super.key});

  @override
  State<LogoAnimationScreen> createState() => _LogoAnimationScreenState();
}

class _LogoAnimationScreenState extends State<LogoAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  String _displayText = '';
  bool _showFullLogo = false;
  bool _showSubtitle = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _startAnimation();
  }

  void _startAnimation() async {
    // Start with "SHE" only
    setState(() {
      _displayText = 'SHE';
    });

    // Play zoom out animation
    await _controller.forward();

    // After animation completes, show full logo
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      _showFullLogo = true;
    });

    // After 1 second, show subtitle
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _showSubtitle = true;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Opacity(
                    opacity: _opacityAnimation.value,
                    child:
                        _showFullLogo
                            ? const SizedBox(
                              width: 390,
                              height: 164,
                              child: SheGoLogo(),
                            )
                            : Text(
                              _displayText,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 80,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                  ),
                );
              },
            ),
            if (_showSubtitle)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Empowering Women, One Ride at a Time',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 18,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class SheGoLogo extends StatelessWidget {
  const SheGoLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _SheGoLogoPainter());
  }
}

class _SheGoLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;

    // Draw all the paths from the SVG
    // Path 1
    var path = Path();
    path.moveTo(49.3418, 76.4226);
    path.cubicTo(49.9229, 76.9083, 50.1701, 77.4504, 50.0877, 78.0403);
    path.cubicTo(50.014, 78.5781, 49.7495, 79.1202, 49.2941, 79.658);
    path.lineTo(43.9509, 86.6232);
    path.cubicTo(43.3611, 87.3822, 42.7929, 87.7552, 42.2551, 87.7552);
    path.cubicTo(41.8214, 87.7552, 41.34, 87.5383, 40.8066, 87.1089);
    path.cubicTo(38.92, 85.5433, 36.9813, 84.3419, 34.9906, 83.5049);
    path.cubicTo(33, 82.6678, 30.8748, 82.2472, 28.6066, 82.2472);
    path.cubicTo(26.4468, 82.2472, 24.6859, 82.6678, 23.3284, 83.5049);
    path.cubicTo(21.971, 84.3419, 21.199, 85.4348, 21.0082, 86.7837);
    path.cubicTo(20.865, 87.8115, 21.0732, 88.6356, 21.637, 89.2557);
    path.cubicTo(22.1965, 89.8759, 23.0943, 90.4311, 24.3216, 90.9168);
    path.cubicTo(25.549, 91.4026, 27.3662, 91.9447, 29.7646, 92.5345);
    path.cubicTo(33.8327, 93.5624, 37.1114, 94.8158, 39.6052, 96.3034);
    path.cubicTo(42.099, 97.7866, 43.8641, 99.6385, 44.9094, 101.85);
    path.cubicTo(45.9502, 104.067, 46.2495, 106.764, 45.8071, 109.948);
    path.cubicTo(45.2823, 113.729, 43.8945, 116.995, 41.6479, 119.749);
    path.cubicTo(39.4014, 122.503, 36.4652, 124.607, 32.8308, 126.068);
    path.cubicTo(29.2008, 127.525, 25.1413, 128.254, 20.6612, 128.254);
    path.cubicTo(16.5584, 128.254, 12.8633, 127.647, 9.57584, 126.432);
    path.cubicTo(6.28839, 125.218, 3.41728, 123.531, 0.966878, 121.371);
    path.cubicTo(0.246936, 120.725, -0.0696436, 120.1, 0.0127594, 119.506);
    path.cubicTo(0.0864884, 118.969, 0.385718, 118.374, 0.910495, 117.724);
    path.lineTo(6.05854, 111.001);
    path.cubicTo(6.65704, 110.19, 7.25121, 109.787, 7.84538, 109.787);
    path.cubicTo(8.2227, 109.787, 8.7041, 110.03, 9.28092, 110.516);
    path.cubicTo(11.0157, 112.029, 13.0324, 113.231, 15.3397, 114.12);
    path.cubicTo(17.647, 115.009, 20.015, 115.456, 22.4437, 115.456);
    path.cubicTo(25.0372, 115.456, 27.0756, 115.039, 28.5719, 114.202);
    path.cubicTo(30.0638, 113.365, 30.9095, 112.246, 31.1047, 110.841);
    path.cubicTo(31.2392, 109.87, 31.0266, 109.059, 30.4715, 108.412);
    path.cubicTo(29.912, 107.766, 28.9666, 107.185, 27.6351, 106.673);
    path.cubicTo(26.3036, 106.161, 24.3303, 105.58, 21.7238, 104.93);
    path.cubicTo(17.8638, 103.958, 14.7369, 102.77, 12.3385, 101.369);
    path.cubicTo(9.94014, 99.9638, 8.22269, 98.1422, 7.18615, 95.9043);
    path.cubicTo(6.1496, 93.6621, 5.85902, 90.8951, 6.31441, 87.6033);
    path.cubicTo(6.83918, 83.8258, 8.20967, 80.5731, 10.4259, 77.8451);
    path.cubicTo(12.6421, 75.1215, 15.4785, 73.0397, 18.9481, 71.6085);
    path.cubicTo(22.4133, 70.1773, 26.2516, 69.4617, 30.4628, 69.4617);
    path.cubicTo(37.9225, 69.4573, 44.2111, 71.782, 49.3418, 76.4226);
    path.close();
    canvas.drawPath(path, paint);

    // Path 2
    path = Path();
    path.moveTo(102.63, 128.254);
    path.lineTo(92.8332, 128.254);
    path.cubicTo(92.1306, 128.254, 91.6275, 128.081, 91.3283, 127.729);
    path.cubicTo(91.0247, 127.378, 90.9249, 126.853, 91.0203, 126.151);
    path.lineTo(93.7483, 106.552);
    path.cubicTo(93.809, 106.122, 93.757, 105.81, 93.5965, 105.619);
    path.cubicTo(93.4317, 105.433, 93.1108, 105.337, 92.625, 105.337);
    path.lineTo(73.9152, 105.337);
    path.cubicTo(73.4295, 105.337, 73.0912, 105.433, 72.9047, 105.619);
    path.cubicTo(72.7182, 105.81, 72.5924, 106.118, 72.5317, 106.552);
    path.lineTo(69.8037, 126.151);
    path.cubicTo(69.6996, 126.91, 69.4481, 127.447, 69.0534, 127.773);
    path.cubicTo(68.6588, 128.098, 68.0819, 128.258, 67.3273, 128.258);
    path.lineTo(57.5214, 128.258);
    path.cubicTo(56.8188, 128.258, 56.3157, 128.085, 56.0164, 127.734);
    path.cubicTo(55.7128, 127.382, 55.6131, 126.858, 55.7085, 126.155);
    path.lineTo(63.3026, 71.5695);
    path.cubicTo(63.4067, 70.8149, 63.6582, 70.2727, 64.0529, 69.9518);
    path.cubicTo(64.4475, 69.6265, 64.9983, 69.4661, 65.7009, 69.4661);
    path.lineTo(75.4982, 69.4661);
    path.cubicTo(76.2529, 69.4661, 76.7863, 69.6309, 77.0899, 69.9518);
    path.cubicTo(77.3935, 70.2771, 77.4976, 70.8149, 77.3891, 71.5695);
    path.lineTo(74.6612, 91.1684);
    path.cubicTo(74.6005, 91.6021, 74.6395, 91.91, 74.7739, 92.1009);
    path.cubicTo(74.9084, 92.2917, 75.2206, 92.3828, 75.7064, 92.3828);
    path.lineTo(94.4162, 92.3828);
    path.cubicTo(94.9019, 92.3828, 95.2532, 92.2874, 95.4701, 92.1009);
    path.cubicTo(95.6869, 91.9144, 95.8214, 91.6021, 95.8821, 91.1684);
    path.lineTo(98.6101, 71.5695);
    path.cubicTo(98.7142, 70.8149, 98.9657, 70.2727, 99.3604, 69.9518);
    path.cubicTo(99.755, 69.6265, 100.306, 69.4661, 101.008, 69.4661);
    path.lineTo(110.806, 69.4661);
    path.cubicTo(112.263, 69.4661, 112.896, 70.1687, 112.701, 71.5738);
    path.lineTo(105.107, 126.159);
    path.cubicTo(104.912, 127.556, 104.088, 128.254, 102.63, 128.254);
    path.close();
    canvas.drawPath(path, paint);

    // Path 3
    path = Path();
    path.moveTo(158.14, 115.781);
    path.cubicTo(158.448, 116.106, 158.547, 116.644, 158.439, 117.403);
    path.lineTo(157.22, 126.151);
    path.cubicTo(157.025, 127.556, 156.197, 128.258, 154.74, 128.258);
    path.lineTo(120.642, 128.258);
    path.cubicTo(119.939, 128.258, 119.436, 128.085, 119.137, 127.734);
    path.cubicTo(118.834, 127.382, 118.734, 126.858, 118.829, 126.155);
    path.lineTo(126.423, 71.5695);
    path.cubicTo(126.527, 70.8149, 126.779, 70.2727, 127.174, 69.9518);
    path.cubicTo(127.568, 69.6265, 128.119, 69.4661, 128.822, 69.4661);
    path.lineTo(162.837, 69.4661);
    path.cubicTo(164.294, 69.4661, 164.927, 70.1687, 164.732, 71.5738);
    path.lineTo(163.513, 80.3216);
    path.cubicTo(163.409, 81.0762, 163.158, 81.6183, 162.763, 81.9393);
    path.cubicTo(162.364, 82.2646, 161.791, 82.425, 161.037, 82.425);
    path.lineTo(140.228, 82.425);
    path.cubicTo(139.742, 82.425, 139.404, 82.5204, 139.217, 82.7069);
    path.cubicTo(139.031, 82.8978, 138.905, 83.2057, 138.844, 83.6394);
    path.lineTo(137.795, 91.1727);
    path.cubicTo(137.725, 91.6585, 137.765, 91.9838, 137.903, 92.1442);
    path.cubicTo(138.042, 92.3047, 138.354, 92.3871, 138.84, 92.3871);
    path.lineTo(156.982, 92.3871);
    path.cubicTo(157.736, 92.3871, 158.253, 92.5649, 158.53, 92.9162);
    path.cubicTo(158.803, 93.2675, 158.89, 93.8183, 158.786, 94.5773);
    path.lineTo(157.58, 103.243);
    path.cubicTo(157.481, 103.945, 157.246, 104.47, 156.873, 104.821);
    path.cubicTo(156.5, 105.173, 155.937, 105.346, 155.182, 105.346);
    path.lineTo(137.04, 105.346);
    path.cubicTo(136.554, 105.346, 136.216, 105.441, 136.03, 105.632);
    path.cubicTo(135.843, 105.823, 135.717, 106.131, 135.657, 106.565);
    path.lineTo(134.607, 114.098);
    path.cubicTo(134.546, 114.532, 134.585, 114.84, 134.72, 115.031);
    path.cubicTo(134.854, 115.221, 135.167, 115.312, 135.652, 115.312);
    path.lineTo(156.548, 115.312);
    path.cubicTo(157.303, 115.299, 157.836, 115.46, 158.14, 115.781);
    path.close();
    canvas.drawPath(path, paint);

    // Path 4
    path = Path();
    path.moveTo(270.078, 116.618);
    path.cubicTo(269.609, 117.368, 268.72, 118.066, 267.415, 118.721);
    path.cubicTo(261.248, 121.805, 255.007, 124.169, 248.696, 125.804);
    path.cubicTo(242.386, 127.439, 235.772, 128.258, 228.859, 128.258);
    path.cubicTo(219.044, 128.254, 210.188, 126.181, 202.29, 122.017);
    path.cubicTo(194.393, 117.858, 188.178, 111.995, 183.641, 104.422);
    path.cubicTo(179.105, 96.8498, 176.841, 88.1585, 176.841, 78.3439);
    path.cubicTo(176.841, 68.0652, 179.131, 58.9965, 183.711, 51.1422);
    path.cubicTo(188.291, 43.2923, 194.623, 37.2161, 202.707, 32.9138);
    path.cubicTo(210.791, 28.6159, 219.929, 26.4647, 230.117, 26.4647);
    path.cubicTo(237.125, 26.4647, 243.739, 27.4449, 249.954, 29.4095);
    path.cubicTo(256.169, 31.3742, 261.755, 34.0848, 266.708, 37.5414);
    path.cubicTo(268.295, 38.5693, 269.093, 39.6448, 269.093, 40.7638);
    path.cubicTo(269.093, 41.7006, 268.764, 42.6331, 268.113, 43.5698);
    path.lineTo(260.961, 54.6465);
    path.cubicTo(260.493, 55.3968, 260.024, 55.9303, 259.56, 56.2599);
    path.cubicTo(259.092, 56.5895, 258.533, 56.75, 257.878, 56.75);
    path.cubicTo(257.127, 56.75, 256.243, 56.4724, 255.215, 55.9086);
    path.cubicTo(247.083, 51.2333, 238.717, 48.9, 230.117, 48.9);
    path.cubicTo(224.413, 48.9, 219.461, 50.1404, 215.254, 52.6168);
    path.cubicTo(211.047, 55.0932, 207.798, 58.5065, 205.508, 62.8521);
    path.cubicTo(203.218, 67.1978, 202.074, 72.129, 202.074, 77.6456);
    path.cubicTo(202.074, 83.2534, 203.24, 88.2106, 205.578, 92.5085);
    path.cubicTo(207.911, 96.8108, 211.138, 100.15, 215.254, 102.536);
    path.cubicTo(219.365, 104.921, 224.088, 106.109, 229.414, 106.109);
    path.cubicTo(235.113, 106.109, 240.07, 105.316, 244.277, 103.724);
    path.cubicTo(245.118, 103.351, 245.678, 102.978, 245.96, 102.601);
    path.cubicTo(246.242, 102.228, 246.38, 101.573, 246.38, 100.636);
    path.lineTo(246.38, 80.868);
    path.cubicTo(246.38, 79.5583, 246.662, 78.6041, 247.222, 77.9926);
    path.cubicTo(247.781, 77.3854, 248.714, 77.0818, 250.028, 77.0818);
    path.lineTo(267.133, 77.0818);
    path.cubicTo(268.443, 77.0818, 269.375, 77.3854, 269.939, 77.9926);
    path.cubicTo(270.498, 78.5998, 270.78, 79.5583, 270.78, 80.868);
    path.lineTo(270.78, 113.257);
    path.cubicTo(270.776, 114.749, 270.546, 115.872, 270.078, 116.618);
    path.close();
    canvas.drawPath(path, paint);

    // Path 5 (G circle)
    path = Path();
    path.moveTo(337.492, 85.7038);
    path.cubicTo(342.1, 85.7038, 345.836, 81.9679, 345.836, 77.3594);
    path.cubicTo(345.836, 72.7509, 342.1, 69.015, 337.492, 69.015);
    path.cubicTo(332.884, 69.015, 329.148, 72.7509, 329.148, 77.3594);
    path.cubicTo(329.148, 81.9679, 332.884, 85.7038, 337.492, 85.7038);
    path.close();
    canvas.drawPath(path, paint);

    // Path 6 (G line)
    path = Path();
    path.moveTo(337.492, 85.7038);
    path.cubicTo(342.1, 85.7038, 345.836, 81.9679, 345.836, 77.3594);
    path.cubicTo(345.836, 72.7509, 342.1, 69.015, 337.492, 69.015);
    path.cubicTo(332.884, 69.015, 329.148, 72.7509, 329.148, 77.3594);
    path.cubicTo(329.148, 81.9679, 332.884, 85.7038, 337.492, 85.7038);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
