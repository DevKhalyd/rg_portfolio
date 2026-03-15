// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rg_portfolio/core/mixin/dialogs.dart';
import 'package:rg_portfolio/core/router/routes.dart';
import 'package:rg_portfolio/features/tic_tac_toe/presentation/riverpod/usecases/create_game_usecase_provider.dart';
import 'package:rg_portfolio/features/tic_tac_toe/presentation/riverpod/usecases/initialize_connection_usecase_provider.dart';
import 'package:rg_portfolio/features/tic_tac_toe/presentation/riverpod/usecases/join_game_usecase_provider.dart';

/// This screen is the main entry point for the Tic Tac Toe game.
/// It allows the user to create a new game or join an existing one.
/// The user can enter a WebSocket URL to connect to the game server.
class TicTacToeScreen extends ConsumerStatefulWidget {
  const TicTacToeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TicTacToeScreenState();
}

class _TicTacToeScreenState extends ConsumerState<TicTacToeScreen>
    with Dialogs {
  final formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> loadNotifier = ValueNotifier<bool>(false);
  String webSocketHost = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tic Tac Toe')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: 'ws://localhost:3000',
                decoration: const InputDecoration(labelText: 'WebSocket URL'),
                validator:
                    (value) =>
                        isValidWsUrl(value)
                            ? null
                            : 'Enter a valid URL. Example: ws://localhost:3000',
                onSaved: (value) => webSocketHost = value ?? '',
              ),
              const SizedBox(height: 60),
              ValueListenableBuilder<bool>(
                valueListenable: loadNotifier,
                builder: (context, isLoading, child) {
                  return isLoading ? buildLoadingWidget() : buildButtons();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButtons() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            if (formKey.currentState?.validate() == false) {
              return;
            }

            formKey.currentState?.save();
            final connectWS = ref.read(initializeConnectionUseCaseProvider);
            log('Server connecting to $webSocketHost');

            setLoading(true);

            final isConnected = await connectWS.call(webSocketHost);

            // The user leaves the screen after the connection is / not stablished
            if (!mounted) {
              setLoading(false);
              return;
            }

            if (!isConnected) {
              setLoading(false);
              showWarningDialog(
                context: context,
                title: 'Connection Error',
                content:
                    'WebSocket is not connected. Please veryfi your server is running.',
              );
              return;
            }

            final gameId = await ref.read(createGameUseCaseProvider).call(null);

            setLoading(false);
            if (gameId == null) {
              showWarningDialog(
                context: context,
                title: 'Game Error',
                content: 'Game creation failed. Please try again.',
              );
              return;
            }
            context.go(ticTacToeGameRoute, extra: {'gameID': gameId});
          },
          child: const Text('Create New Game'),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            showInputDialog(
              context: context,
              title: 'Enter Game ID',
              labelText: 'Game ID',
              onConfirm: (gameID) async {
                if (gameID.isEmpty) return;

                setLoading(true);

                final isJoined = await ref
                    .read(joinGameUseCaseProvider)
                    .call(gameID);

                setLoading(false);

                if (!isJoined) {
                  showWarningDialog(
                    context: context,
                    title: 'Join Game Error',
                    content:
                        'Game joining failed. Please verify the game ID.',
                  );
                  return;
                }

                // TODO: Use the GameEntity to get the player ID from the joinUseCase
                // then redirect to the game screen
              },
            );
          },
          child: const Text('Join Game'),
        ),
      ],
    );
  }

  Widget buildLoadingWidget() {
    return const Center(child: CircularProgressIndicator());
  }

  void setLoading(bool loading) {
    loadNotifier.value = loading;
  }

  bool isValidWsUrl(String? url) {
    if (url?.isEmpty ?? true) return false;

    final uri = Uri.tryParse(url!);
    if (uri == null) return false;

    final isWsScheme = uri.scheme == 'ws' || uri.scheme == 'wss';
    final hasHost = uri.host.isNotEmpty;

    return isWsScheme && hasHost;
  }
}
