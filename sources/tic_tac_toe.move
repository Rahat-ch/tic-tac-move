module tic_tac_toe::game {
    use std::signer;
    use std::vector;
    use std::error;

    /// Error codes
    const E_GAME_STATE_ALREADY_EXISTS: u64 = 1;
    const E_GAME_STATE_NOT_FOUND: u64 = 2;

    /// Represents the game state (resource)
    struct GameState has key {
        board: vector<u8>, // Current board state
        wins: u64,         // Total number of wins
        losses: u64,       // Total number of losses
        in_progress: bool, // Is a game currently in progress
    }

    /// Initializes the game state under the player's account
    public entry fun create_game_state(account: &signer) {
        let account_addr = signer::address_of(account);
        assert!(
            !exists<GameState>(account_addr),
            error::already_exists(E_GAME_STATE_ALREADY_EXISTS)
        );

        // Initialize the board with 9 zeros
        let board = initialize_board();

        // Create the GameState resource
        let game_state = GameState {
            board,
            wins: 0u64,
            losses: 0u64,
            in_progress: false,
        };

        // Store the GameState resource under the player's account
        move_to(account, game_state);
    }

    /// Helper function to initialize the board
    fun initialize_board(): vector<u8> {
        let board = vector::empty<u8>();
        let pos = 0u8;
        while (pos < 9u8) {
            vector::push_back(&mut board, 0u8);
            pos = pos + 1u8;
        };
        board
    }

    /// Updates the game state
    public entry fun update_game_state(
        account: &signer,
        new_board: vector<u8>,
        new_wins: u64,
        new_losses: u64,
        new_in_progress: bool
    ) acquires GameState {
        let account_addr = signer::address_of(account);
        assert!(
            exists<GameState>(account_addr),
            error::not_found(E_GAME_STATE_NOT_FOUND)
        );

        // Borrow a mutable reference to the GameState resource
        let game_state = borrow_global_mut<GameState>(account_addr);

        // Update the game state fields
        game_state.board = new_board;
        game_state.wins = new_wins;
        game_state.losses = new_losses;
        game_state.in_progress = new_in_progress;
    }

    /// Retrieves the game state (returns copyable types)
    #[view]
    public fun get_game_state(account_addr: address): (vector<u8>, u64, u64, bool) acquires GameState {
        assert!(
            exists<GameState>(account_addr),
            error::not_found(E_GAME_STATE_NOT_FOUND)
        );
        let game_state = borrow_global<GameState>(account_addr);
        (
            game_state.board,
            game_state.wins,
            game_state.losses,
            game_state.in_progress,
        )
    }
}
