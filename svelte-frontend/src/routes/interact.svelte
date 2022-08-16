<script>
	import { ethers } from 'ethers';
	import Header from '$lib/components/header.svelte';
	import Wallet from '$lib/components/Wallet.svelte';
	import SendTX from '$lib/components/SendTX.svelte';
	import { onMount } from 'svelte';
	import ContractPortal from '../lib/abis/MySBT.json';

	const CONTRACT_ADDRESS = '0x4027e07A4caDd6DeE390b704Fe377Ba82eC3B81a';

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
