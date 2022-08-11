<script>
	import { ethers } from 'ethers';
	import Header from '$lib/components/header.svelte';
	import Wallet from '$lib/components/Wallet.svelte';
	import SendTX from '$lib/components/SendTX.svelte';
	import { onMount } from 'svelte';
	import ContractPortal from '../../../backend/artifacts/contracts/MySBT.sol/MySBT.json';

	const CONTRACT_ADDRESS = '0x1443F3470c9C597D27C846171f631aA5CBBd23Fc';

	async function getTotalSupply() {
		if (!window.ethereum) {
			return;
		}

		const provider = new ethers.providers.Web3Provider(window.ethereum);
		const Contract = new ethers.Contract(CONTRACT_ADDRESS, ContractPortal.abi, provider);

		const totalSupply = await Contract.totalSupply();
		console.log(totalSupply);
	}

	onMount(getTotalSupply);
</script>

<svelte:head>
	<title>Interaction</title>
</svelte:head>

<main>
	<Header />
	<Wallet />
	<SendTX {CONTRACT_ADDRESS} />
</main>

<style>
</style>
