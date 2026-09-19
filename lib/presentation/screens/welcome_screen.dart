import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakers_shop_ui/constants/string_const.dart';
import 'package:sneakers_shop_ui/core/app_colors.dart';
import 'package:sneakers_shop_ui/core/app_icons.dart';
import 'package:sneakers_shop_ui/core/app_textstyles.dart';
import 'package:sneakers_shop_ui/router/router.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _watermarkFade;
  late final Animation<Offset> _watermarkSlide;
  late final Animation<double> _sneakerFade;
  late final Animation<Offset> _sneakerSlide;
  late final Animation<double> _comfortableFade;
  late final Animation<Offset> _comfortableSlide;
  late final Animation<double> _fashionableFade;
  late final Animation<Offset> _fashionableSlide;
  late final Animation<double> _arrowFade;
  late final Animation<Offset> _arrowSlide;
  late final Animation<double> _sneakersFade;
  late final Animation<Offset> _sneakersSlide;
  late final Animation<double> _ctaFade;
  late final Animation<double> _ctaScale;
  bool _ctaPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    _watermarkFade = _fade(0.0, 0.35);
    _watermarkSlide = _slide(begin: const Offset(-0.25, 0), start: 0.0, end: 0.35);
    _sneakerFade = _fade(0.15, 0.55);
    _sneakerSlide = _slide(begin: const Offset(0.4, 0), start: 0.15, end: 0.55);
    _comfortableFade = _fade(0.35, 0.55);
    _comfortableSlide = _slide(begin: const Offset(0, -0.2), start: 0.35, end: 0.55);
    _fashionableFade = _fade(0.42, 0.62);
    _fashionableSlide = _slide(begin: const Offset(0, -0.2), start: 0.42, end: 0.62);
    _arrowFade = _fade(0.48, 0.68);
    _arrowSlide = _slide(begin: const Offset(0, -0.15), start: 0.48, end: 0.68);
    _sneakersFade = _fade(0.55, 0.75);
    _sneakersSlide = _slide(begin: const Offset(0, -0.15), start: 0.55, end: 0.75);
    _ctaFade = _fade(0.65, 1.0);
    _ctaScale = Tween(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.65, 1.0, curve: Curves.easeOutBack)),
    );
    _controller.forward();
  }

  Animation<double> _fade(double start, double end) => CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.easeOutCubic),
      );

  Animation<Offset> _slide({required Offset begin, required double start, required double end}) =>
      Tween(begin: begin, end: Offset.zero).animate(
        CurvedAnimation(parent: _controller, curve: Interval(start, end, curve: Curves.easeOutCubic)),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Stack(
          children: [
            _buildWatermark(context),
            _buildSneaker(context),
            SafeArea(
              child: Padding(
                padding: .only(right: 22, top: 100),
                child: Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    _buildHeadline(),
                    const Spacer(),
                    Align(alignment: .centerRight, child: _buildCta(context)),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWatermark(BuildContext context) {
    return FadeTransition(
      opacity: _watermarkFade,
      child: SlideTransition(
        position: _watermarkSlide,
        child: Container(
          height: .infinity,
          width: 125,
          color: AppColors.white.withValues(alpha: 0.1),
          child: RotatedBox(
            quarterTurns: 3,
            child: Text(
              StringConst.welcomeWatermark,
              style: AppTextStyles.welcomeWatermark,
              maxLines: 1,
              textAlign: .center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeadline() {
    return Align(
      alignment: .centerRight,
      child: Column(
        crossAxisAlignment: .end,
        spacing: 4,
        children: [
          _buildAnimatedItem(
            fade: _comfortableFade,
            slide: _comfortableSlide,
            child: Text(StringConst.welcomeComfortable, style: AppTextStyles.welcomeHeadline),
          ),
          _buildAnimatedItem(
            fade: _fashionableFade,
            slide: _fashionableSlide,
            child: Text(StringConst.welcomeFashionable, style: AppTextStyles.welcomeHeadline),
          ),
          _buildAnimatedItem(
            fade: _arrowFade,
            slide: _arrowSlide,
            child: SvgPicture.asset(AppIcons.icArrowLine),
          ),
          _buildAnimatedItem(
            fade: _sneakersFade,
            slide: _sneakersSlide,
            child: Text(StringConst.welcomeSneakers, style: AppTextStyles.welcomeSneakers),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedItem({
    required Animation<double> fade,
    required Animation<Offset> slide,
    required Widget child,
  }) {
    return FadeTransition(opacity: fade, child: SlideTransition(position: slide, child: child));
  }

  Widget _buildSneaker(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Positioned(
      left: size.width * 0.1,
      top: size.height * 0.25,
      child: FadeTransition(
        opacity: _sneakerFade,
        child: SlideTransition(
          position: _sneakerSlide,
          child: Transform.rotate(
            angle: 0.15,
            child: Image.asset(AppIcons.welcomePageSneaker, width: size.width * 0.9, fit: .contain),
          ),
        ),
      ),
    );
  }

  Widget _buildCta(BuildContext context) {
    return FadeTransition(
      opacity: _ctaFade,
      child: ScaleTransition(
        scale: _ctaScale,
        child: GestureDetector(
          onTapDown: (_) => setState(() => _ctaPressed = true),
          onTapCancel: () => setState(() => _ctaPressed = false),
          onTapUp: (_) {
            setState(() => _ctaPressed = false);
            context.go(NamedRoutes.home.routeName);
          },
          child: AnimatedScale(
            scale: _ctaPressed ? 0.92 : 1,
            duration: const Duration(milliseconds: 100),
            child: Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: .circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.cardShadow,
                    blurRadius: 16,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: const Icon(Icons.arrow_forward_rounded, size: 28, color: AppColors.primary),
            ),
          ),
        ),
      ),
    );
  }
}
