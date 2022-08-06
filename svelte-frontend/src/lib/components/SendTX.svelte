<script>
	export let CONTRACT_ADDRESS;
	import { ethers } from 'ethers';
	import ContractPortal from '../../../../backend/artifacts/contracts/MySBT.sol/MySBT.json';
	let message = '';
	let loading = false;

	async function sendTransaction() {
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

			const transaction = await Contract.safeMint(senderaddress, {
				gasLimit: 100000
			});
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
		<button disabled={loading} class="button buttonWave" on:click={() => sendTransaction()}>
			<span class="buttonEmoji" role="img" aria-label="wave"> 🔥 </span>
			Mint
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
