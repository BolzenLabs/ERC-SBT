<script>
	import Form from '$lib/components/Form.svelte';
	import MintBg from '../lib/assets/mint-bg.png';
	import TriGradient from '$lib/assets/tri-gradient.svg';
	import { user } from '$lib/components/store';
	import { store_picture, store_json } from '$lib/stores/web3_storage';

	export let result, fileinput, picture_file;

	let chooser_text = 'Choose Image';
	let status = '';
	let picture_state = false;

	async function mint_profile(name, username, handle, bio) {
		const imageURI = await store_picture(picture_file);
		console.log(imageURI);
		const jsonString = JSON.stringify({
			name: `${name}`,
			username: `${username}`,
			handle: `${handle}`,
			bio: `${bio}`
		});
		const jsonURI = await store_json(jsonString);

		console.log('exit after ');
	}
	const onFileSelected = (e) => {
		picture_state = true;
		const { size, type } = e.target.files[0]; // get size in bytes , and file type

		// Check file size to ensure it is less than 2MB.
		if (size / 1024 / 1024 > 2) {
			status = 'File size exceeded the limit of 2MB';
			picture_state = false;
		}
		if (picture_state) {
			//Change result to the uploaded picture
			let image = e.target.files[0];
			let reader = new FileReader();
			reader.readAsDataURL(image);
			reader.onload = (e) => {
				result = e.target.result;
			};
			picture_file = e.target.files[0];
		}
	};

	function handle_upload() {
		chooser_text = 'Choose New Image';
		return '';
	}
</script>

<section class="mint">
	<img id="mint-image" src={MintBg} alt="" />
	<img id="mint-gradient" src={TriGradient} alt="" />
	<img id="mint-gradient-2" src={TriGradient} alt="" />
	<div class="container mint-container">
		<h6 class="uppercase text-green">Start for free</h6>
		<h1>Create new account<span class="text-green">.</span></h1>
		<p>already a member? <a href="#" class="text-blue">Connect wallet</a></p>
		<form action="" class="card mint-card">
			<div class="flex flex-between">
				<div id="name-div">
					<label for="">Name</label>
					<input type="text" bind:value={$user.name} />
				</div>
				<div>
					<label for="">Username</label>
					<input type="text" bind:value={$user.username} />
				</div>
			</div>
			<label for="">Description</label>
			<textarea name="description" id="" bind:value={$user.bio} />
			<div class="flex choose-image">
				<a
					class="upload-btn"
					on:click={() => {
						fileinput.click();
					}}>Upload Image <span>+</span></a
				>
				<img
					class="avatar"
					on:click={() => {
						fileinput.click();
					}}
					src={result}
					alt=""
				/>
			</div>
			<p>{status}</p>
			<p class="text-right">
				<a
					class="btn btn-primary"
					href="javascript:void"
					type="submit"
					title="Mint Button "
					on:click={() => {
						mint_profile($user.name, $user.username, $user.handle, $user.bio);
					}}>Mint Profile</a
				>
			</p>
		</form>
		{handle_upload()}
		<!-- form component -->
		<!-- <Form {picture_file} {fileinput} /> -->
		<!-- FOR DEBUGGING  -->
		<!-- <p>{JSON.stringify($user, 0, 2)}</p> -->

		{#if result}
			{handle_upload()}
			<!-- <Form {picture_file} /> -->
			<!-- FOR DEBUGGING  -->
			<!-- <p>{JSON.stringify($user, 0, 2)}</p> -->
		{:else}
			<!-- blank -->
		{/if}

		<div
			class="chan"
			on:click={() => {
				fileinput.click();
			}}
		/>
		<input
			style="display:none"
			type="file"
			accept=".jpg, .jpeg, .png"
			on:change={(e) => onFileSelected(e)}
			bind:this={fileinput}
		/>
	</div>
</section>
