import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/components/movie_list.dart';
import 'package:movies/movies/cubit/movie_cubit.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final _scrollController = ScrollController();
  late MovieCubit _movieCubit;

  @override
  void initState() {
    super.initState();
    _movieCubit = context.read<MovieCubit>();

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          loaded: (state) => MovieList(
              scrollController: _scrollController,
              movies: state.result.results),
        );
      },
    );
  }

  void _onScroll() {
    if (_isBottom) {
      _movieCubit.loadMorePages();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
