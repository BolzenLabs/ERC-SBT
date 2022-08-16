import { writable } from 'svelte/store';

export const walletAddress = writable('');
export const connectWallet = async () => {
	const { ethereum } = window as any;
	console.log(ethereum.chainId);
	if (!ethereum) {
		alert('wallet not installed');
	} else {
		if (ethereum.chainId !== '0x2328') {
			try {
				await ethereum.request({
					method: 'wallet_switchEthereumChain',
					params: [{ chainId: '0x2328' }]
				});
			} catch (switchError: any) {
				// This error code indicates that the chain has not been added to MetaMask.
				if (switchError.code === 4902) {
					try {
						await ethereum.request({
							method: 'wallet_addEthereumChain',
							params: [
								{
									chainId: '0x2328',
									chainName: 'Evmos Testnet',
									rpcUrls: ['https://eth.bd.evmos.dev:8545']
								}
							]
						});
					} catch (addError) {
						alert(addError);
					}
				}
				// handle other "switch" errors
			}
		}

		try {
			await ethereum.request({ method: 'eth_requestAccounts' }).then((accounts: string[]) => {
				walletAddress.update(() => accounts[0]);
			});
		} catch (error: { message?: '' } | any) {
			console.log(error.code);
		}
	}
};
