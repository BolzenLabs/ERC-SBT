export type Network = {
	chainId: number;
	rpcUrl: string;
	chainName: String;
	nativeCurrency: { name: string; symbol: string; decimals: number };
	multicall2Address: string; // (Allows you to call multiple view & pure functions off-chain in a single RPC call
	blockExplorerUrl?: string;
};

export const NETWORKS: Network[] = [
	{
		chainId: 1,
		rpcUrl: 'https://eth-mainnet.g.alchemy.com/v2/', // Enter your RPC endpoint here.
		chainName: 'Ethereum',
		nativeCurrency: { name: 'Ether', symbol: 'ETH', decimals: 18 },
		multicall2Address: '0x5BA1e12693Dc8F9c48aAD8770482f4739bEeD696', // Address to Uniswap Multicall2 Contract
		blockExplorerUrl: 'https://etherscan.com'
	},

	{
		chainId: 4,
		rpcUrl: 'https://eth-rinkeby.alchemyapi.io/v2/', // Enter your RPC endpoint here.
		chainName: 'Rinkeby',
		nativeCurrency: { name: 'Ether', symbol: 'ETH', decimals: 18 },
		multicall2Address: '', // Address to Uniswap Multicall2 Contract
		blockExplorerUrl: 'https://rinkeby.etherscan.io'
	}
	// {
	//   chainId: 31337,
	//   rpcUrl: 'http://localhost:8545',
	//   chainName: 'Hardhat',
	//   nativeCurrency: { name: 'Ether', symbol: 'ETH', decimals: 18 },
	//   multicall2Address: ''
	// }
];