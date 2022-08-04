# EVMOS Hackathon

## Basic Setup

Install dependencies

```bash
yarn
```

Enter your own or a RPC provider endpoint for your project in the `rpcUrl` parameter of `./src/lib/config.ts` to make on-chain calls, and interact with Metamask, etc. Replace `ADD RPC PROVIDER HERE` with your RPC provider.

```js
export const NETWORKS: Network[] = [
  {
    chainId: 1,
    rpcUrl: 'ADD RPC PROVIDER HERE', // Your RPC endpoint, add here
...
```

Start development server

```bash
yarn run dev
```
