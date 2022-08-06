<script>
	import { ethers } from 'ethers';
	import Header from '$lib/components/header.svelte';
	import Wallet from '$lib/components/Wallet.svelte';
	import SendTX from '$lib/components/SendTX.svelte';
	import { onMount } from 'svelte';
	import ContractPortal from '../../../backend/artifacts/contracts/MySBT.sol/MySBT.json';

	const CONTRACT_ADDRESS = '0x73856B967615d8c20619DB8f3c2d08557B41D8b0';

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
