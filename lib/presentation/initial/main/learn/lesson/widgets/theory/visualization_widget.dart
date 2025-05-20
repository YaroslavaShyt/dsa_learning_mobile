import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class VisualizationWidget extends StatefulWidget {
  const VisualizationWidget({
    required this.image,
    super.key,
  });

  final String image;

  @override
  State<VisualizationWidget> createState() => _VisualizationWidgetState();
}

class _VisualizationWidgetState extends State<VisualizationWidget>
    with SingleTickerProviderStateMixin {
  late final GifController _controller;
  bool isPlaying = true;

  int currentSpeedMultiplier = 1;
  final List<int> speedMultipliers = [1, 2];
  final Map<int, int> speedToFps = {
    1: 4,
    2: 10,
  };

  @override
  void initState() {
    super.initState();
    _controller = GifController(vsync: this);
    _controller.addListener(() {
      if (_controller.isCompleted) {
        if (isPlaying) {
          _resumeGif(fromStart: true);
        }
      }
    });

    _controller.repeat(
      min: _controller.lowerBound,
      max: _controller.upperBound,
      period: Duration(
        milliseconds: 80000 ~/ speedToFps[currentSpeedMultiplier]!,
      ),
    );
  }

  void _resumeGif({bool fromStart = false}) {
    if (fromStart) {
      _controller.value = _controller.lowerBound;
    }

    _controller.repeat(
      min: _controller.lowerBound,
      max: _controller.upperBound,
      period: Duration(
        milliseconds: 80000 ~/ speedToFps[currentSpeedMultiplier]!,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);

    return Column(
      children: [
        const SizedBox(height: 20),
        if (widget.image.endsWith('gif'))
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Gif(
                  controller: _controller,
                  autostart: Autostart.no,
                  image: NetworkImage(widget.image),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Slider(
                      min: _controller.lowerBound,
                      max: _controller.upperBound,
                      value: _controller.value,
                      onChanged: (newValue) {
                        setState(() {
                          _controller.value = newValue;
                        });
                      },
                      onChangeEnd: (newValue) {
                        if (isPlaying) {
                          _resumeGif();
                        }
                      },
                      activeColor: colorScheme.primaryFixed,
                      inactiveColor: colorScheme.onSurface.withAlpha(76),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      final wasPlaying = isPlaying;

                      setState(() {
                        _controller.stop();
                        isPlaying = false;

                        final currentIndex =
                            speedMultipliers.indexOf(currentSpeedMultiplier);
                        final nextIndex =
                            (currentIndex + 1) % speedMultipliers.length;
                        currentSpeedMultiplier = speedMultipliers[nextIndex];
                      });

                      setState(() {
                        if (wasPlaying) {
                          _resumeGif();
                          isPlaying = true;
                        }
                      });
                    },
                    child: Text(
                      '${currentSpeedMultiplier}x',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      if (_controller.value - 0.01 >= _controller.lowerBound) {
                        if (isPlaying) {
                          _controller.stop();
                          setState(() {
                            isPlaying = false;
                          });
                        }
                        _controller.animateBack(
                          _controller.value - 0.01,
                          duration: const Duration(milliseconds: 200),
                        );
                      }
                    },
                    icon: const Icon(
                      size: 36,
                      Icons.keyboard_double_arrow_left_rounded,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (isPlaying) {
                          _controller.stop();
                        } else {
                          _resumeGif();
                        }
                        isPlaying = !isPlaying;
                      });
                    },
                    icon: Icon(
                      size: 36,
                      isPlaying ? Icons.pause : Icons.play_arrow_rounded,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_controller.value + 0.01 <= _controller.upperBound) {
                        if (isPlaying) {
                          _controller.stop();
                          setState(() {
                            isPlaying = false;
                          });
                        }
                        _controller.animateTo(
                          _controller.value + 0.01,
                          duration: const Duration(milliseconds: 200),
                        );
                      }
                    },
                    icon: const Icon(
                      size: 36,
                      Icons.keyboard_double_arrow_right_rounded,
                    ),
                  ),
                ],
              ),
            ],
          ),
        if (!widget.image.endsWith('gif'))
          Align(
            alignment: Alignment.center,
            child: ClipRect(
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: colorScheme.onSurface.withAlpha(153), // ≈ 0.6
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.network(
                  widget.image,
                  height: 300,
                  frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) {
                    if (frame == null) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: colorScheme.onSurface.withAlpha(153),
                        ),
                      );
                    }
                    return child;
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.error,
                      color: colorScheme.onSurface.withAlpha(153),
                    );
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }
}
