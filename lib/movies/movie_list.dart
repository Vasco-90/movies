import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/components/movie_card.dart';
import 'package:movies/movies/cubit/movie_cubit.dart';

class MovieList extends StatefulWidget {
  const MovieList({
    Key? key,
  }) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
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
          loaded: (state) => Scrollbar(
            controller: _scrollController,
            isAlwaysShown: true,
            child: GridView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(8),
              shrinkWrap: false,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 4,
              ),
              itemCount: state.result.results.length + 1,
              itemBuilder: (context, index) =>
                  index >= state.result.results.length
                      ? Center(child: CircularProgressIndicator.adaptive())
                      : MovieCard(
                          movie: state.result.results[index],
                        ),
            ),
          ),
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
