<script>
	export let CONTRACT_ADDRESS;
	import { ethers } from 'ethers';
	import ContractPortal from '../abis/MySBT.json';
	let message = '';
	let loading = false;

	async function sendTransaction(choice) {
		loading = true;
		try {
			const provider = new ethers.providers.Web3Provider(window.ethereum);
			const signer = provider.getSigner();
			//Grab the address
			let senderaddress = '';
			const { ethereum } = window;
			await ethereum
				.request({ method: 'eth_requestAccounts' })
				.then((accountList) => {
					const [firstAccount] = accountList;
					senderaddress = firstAccount;
				})
				.catch((error) => {
					console.log('error getting address');
				});

			const Contract = new ethers.Contract(CONTRACT_ADDRESS, ContractPortal.abi, signer);

			let transaction;
			if (choice == 0) {
				transaction = await Contract.safeMint(senderaddress, 'someuser', 'profileURI', 'dataURI', {
					gasLimit: 800000
				});
			} else {
				transaction = await Contract.safeBurn(senderaddress, {
					gasLimit: 800000
				});
			}

			await transaction.wait();
			console.log(transaction);

			loading = false;
		} catch (error) {
			alert('Error while sending wave', error);
			loading = false;
		}
	}
</script>

<div>
	<section class="buttonGroup">
		<button disabled={loading} class="button buttonWave" on:click={() => sendTransaction(0)}>
			<span class="buttonEmoji" role="img" aria-label="wave"> 🌿 </span>
			Mint
		</button>

		<button disabled={loading} class="button buttonWave" on:click={() => sendTransaction(1)}>
			<span class="buttonEmoji" role="img" aria-label="wave"> 🔥 </span>
			Burn
		</button>
	</section>
</div>

<style>
	.buttonWave {
		--button-bg-color: #fde68a;
		--text-100: #1f2937;
	}

	.buttonEmoji {
		padding-right: 10px;
	}
</style>
