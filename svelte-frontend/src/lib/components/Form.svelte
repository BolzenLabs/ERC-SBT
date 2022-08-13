<script>
	import { user } from '../components/store.js';
	import { store_picture, store_json } from '$lib/stores/web3_storage';
	export let picture_file;

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
</script>
