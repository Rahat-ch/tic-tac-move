# Tic Tac Move Bot

This repository contains the codebase for the Tic Tac Move Bot, a Telegram mini-app that lets you play Tic Tac Toe on the Porto Testnet for Movement Network. You can start interacting with the bot by visiting [t.me/tictacmovebot](https://t.me/tictacmovebot).

## Project Overview

The project consists of three main components:

1. **Move Module (Smart Contract)**
   - **File**: `sources/tic_tac_toe.move`
   - **Deployed Address**: `0x0eb6be0e57288a2e1a511906d929272589bfb3cb4aba309bf927752b1a623de2`
   - The Move module defines the game logic for storing and managing the Tic Tac Toe game state on the blockchain.

2. **API**
   - **Directory**: `api`
   - **Deployment**: Hosted on [Render](https://render.com)
   - The API handles all on-chain interactions with the smart contract, including creating game states, updating moves, and fetching the game state.

3. **Frontend**
   - **Directory**: `move-tg-frontend`
   - **Framework**: Next.js using Vite for development
   - The frontend is the user interface displayed within the Telegram app for a seamless gaming experience.

## File Structure

```
TIC_TAC_TOE
├── .movement
├── api
│   ├── node_modules
│   ├── .gitignore
│   ├── index.js
│   ├── package-lock.json
│   ├── package.json
├── build
├── move-tg-frontend
│   ├── node_modules
│   ├── public
│   ├── src
│   ├── .gitignore
│   ├── eslint.config.js
│   ├── index.html
│   ├── package-lock.json
│   ├── package.json
│   ├── README.md
│   ├── vite.config.js
├── scripts
├── sources
│   ├── tic_tac_toe.move
├── tests
├── .gitignore
├── Move.toml
├── readme.md
```

## Getting Started

Follow these steps to set up and run the project:

### Prerequisites

- Node.js and npm installed
- Move CLI installed
- A Telegram account

### Setting Up the API

1. Navigate to the `api` directory:

   ```bash
   cd api
   ```

2. Install dependencies:

   ```bash
   npm install
   ```

3. Run the API locally:

   ```bash
   node index.js
   ```

   The API will interact with the Move smart contract deployed on Porto testnet.

### Setting Up the Frontend

1. Navigate to the `move-tg-frontend` directory:

   ```bash
   cd move-tg-frontend
   ```

2. Install dependencies:

   ```bash
   npm install
   ```

3. Run the frontend locally:

   ```bash
   npm run dev
   ```

4. The frontend is built with Vite for a fast development experience.

## Deployments

- **API**: Deployed on [Render](https://render.com).
- **Frontend**: Hosted on a Next.js-compatible hosting service. Use the URL from your hosting provider during bot setup.

## Registering Your Bot on Telegram

Follow these steps to register and configure your bot on Telegram:

1. **Open Telegram** and search for `BotFather`.
2. Register a new bot by using the `/newbot` command and follow the prompts to choose a name and username.
3. Use the `/setmenubutton` command in `BotFather`.
4. Click on the bottom right square to select the bot.
5. **Paste the URL** for your app that is deployed to vercel.
6. Follow the remaining prompts


## License

This project is open-source and available under the [MIT License](LICENSE).

