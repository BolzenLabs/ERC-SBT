<script>
	import { connectWallet, walletAddress } from '$lib/stores/wallet';
</script>

<nav>
	<div class="container flex flex-between ">
		<a href="/" class="nav-logo">ERC-<span>SBT</span></a>
		<ul class="flex">
			<li><a href="/profiles" class="nav-link">Profiles</a></li>
			<li>
				<button on:click={connectWallet} class="btn btn-primary"
					>{$walletAddress ? $walletAddress : 'Connect Wallet'}</button
				>
			</li>
		</ul>
	</div>
</nav>
