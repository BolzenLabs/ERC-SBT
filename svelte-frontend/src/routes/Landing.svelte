<script>
  import Icon from '@iconify/svelte';
  import GitCoin from '$lib/assets/gitcoin.svg'
  import Zilliqa from '$lib/assets/zilliqaLogo.svg'
  import Web3 from '$lib/assets/web3.svg'
  // gradient svg
  import elipseWhite from '../lib/assets/elipse-white.svg'
  import triGradient from '../lib/assets/tri-gradient.svg'

  import elipseOrange from '../lib/assets/elipse-orange.svg'
  import BlueCircle from '../lib/assets/elipse-blue.svg'
  import GreenCircle from '../lib/assets/elipse-green.svg'
  // why us icons
  import User from '$lib/assets/user.svg'
  import Verified from '$lib/assets/verified.svg'
  import Tool from '$lib/assets/tool.svg'
  const profiles = [
  {
    username: "NFT_CREATOR",
    address: "0x3227edf3d8ef577170f339689a128ce229dd8df2",
    zil: "2.5",
    profileImage:
      "data:image/jpeg;base64,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",
  },
  {
    username: "NFT_LION_KING",
    address: "0x3227edf3d8ef577170f339689a128ce229dd8df2",
    zil: "4.82",
    profileImage:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSM4XkTv7CB8TecNeMJAfNEzuDEpdHQsCak2ScpeKAMNvx1k_RfPmNQ3R69XrLwtCUeKg0&usqp=CAU",
  },
  {
    username: "NFT_BEANIE",
    address: "0x3227edf3d8ef577170f339689a128ce229dd8df2",
    zil: "82",
    profileImage:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhY9ESvMJJ4iJ0xWcr41E0JP6JAA6FGDtajw&usqp=CAU",
  },
  {
    username: "NFT_LAZERZ",
    address: "0x3227edf3d8ef577170f339689a128ce229dd8df2",
    zil: "80",
    profileImage:
      "https://www.artnews.com/wp-content/uploads/2021/08/BAYC-8746.png?w=631",
  },
];
  const AdaptiveContentProps = [
  {
    title: " What is an SBT?",
    subtitle: "On-Chain Identity",
    content:"The Zilliqa Soul-Bound Token is intended to be a POC token that enables users to own their on-chain identity. At its core, it is non-transferable token that users mint for themselves.",
    img: User,
    subcontent: "",
  },
  {
    title: "Purpose of SBT?",
    subtitle: "incentivizing utility",
    // content:
    //   "SBT's bring utility by incentivizing users to interact with the underlying platform to grow their SBT Profile. Users are incentivized through earning educational milestones or solving societal problem. Rewards can be generatged as NFTs, digital assets or just a simple “kudos” on the Profile Page. ERC-SBT establishes a sense of reputation and trust in profiles which is essential for thriving online communities.",
    content:"The Zilliqa Soul-Bound Token is intended to be a POC token that enables users to own their on-chain identity. At its core, it is non-transferable token that users mint for themselves.",

    img: Verified,
    subcontent: "",
  },
  {
    title: "Our vision?",
    subtitle: "Constant innovation",
    // content:
    //   "The concept of an SBT is rather loosely defined and quite novel. Thus, the vision of project reaches far beyond what has currently implemented. Nevertheless, this project serves as one of many starting points for powerful idea that will enable another layer of incentivization on top of decentralized digital ownership.",
    content:"The Zilliqa Soul-Bound Token is intended to be a POC token that enables users to own their on-chain identity. At its core, it is non-transferable token that users mint for themselves.",
    img: Tool,
    subcontent: "",
  },
];
</script>

<section class="hero">
  <img class="white-circle" src={elipseWhite} alt="">

  <!-- <img class="green-circle" src={GreenCircle} alt=""> -->
  <!-- <img class="orange-circle" src={OrangeCircle} alt=""> -->
  <!-- <img class="blue-circle" src={BlueCircle} alt=""> -->
  <div class="container flex flex-between flex-items-center">
    <div class="left">
      <h6 class="uppercase text-green-light">Seamlessly Easy</h6>
      <h1>THe future of <br> Social-Defi</h1>
      <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Sint, ducimus exercitationem deleniti veniam voluptates incidunt tempore iste voluptatem impedit! Illo!</p>
      <div class="flex space-x">
        <a href="#" class="btn btn-primary">Mint Now</a>
        <a href="#" class="btn btn-secondary">Learn more</a>
      </div>
      <div class="flex hero-social-proof space-x">
        <img src={GitCoin} alt="">
        <img src={Zilliqa} alt="">
        <img src={Web3} alt="">
      </div>
    </div>
    <div class="right">
      <img id='tri-gradient' src={triGradient}/>
      <div class="card">
        <img
            class="center"
            src="data:image/jpeg;base64,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"
            alt=""
          />
          
          <div class="card-footer flex flex-between flex-items-center">
            <div class="">
              <h6 class="inline">NFT_CREATOR</h6>
              <p>
                <Icon icon="entypo:wallet" class="inline-block" />
                {String(
                  "0x3227edf3d8ef577170f339689a128ce229dd8df2"
                ).substring(0, 6) +
                  "..." +
                  String(
                    "0x3227edf3d8ef577170f339689a128ce229dd8df2"
                  ).substring(38)}
              </p>
            </div>
            <Icon icon="bi:share-fill" width='25'/>
          </div>
      </div>
    </div>
  </div>
</section>
<!-- why us -->
<section class="why-us">
  <img src={triGradient} id="tri-gradient" alt="">
  <img src={triGradient} id="tri-gradient-2" alt="">
  <div class="container">
    <h1 class='text-center'>Our Platform</h1>
    <ul class="grid">
      {#each AdaptiveContentProps as content}
        <div class="card text-left">
          <!-- <img src={content.img} width='30'alt=""> -->
          <h6 class="text-green-light uppercase">{content.subtitle}</h6>
          <p>{content.content}</p>
        </div>
      {/each}
    </ul>
  </div>
</section>
<section class="featured">
  <img src={triGradient} id="tri-gradient" alt="">
  <img src={triGradient} id="tri-gradient-2" alt="">
  <div class="container">
    <h1 class="text-center">Featured Profiles</h1>
    <div class="grid">
        {#each profiles as user}
        <div class="card">
          <div class="card-top flex flex-between flex-items-center">
            <img
              class="radius-full center"
              alt="logo"
              src={user.profileImage}
            />
          </div>
          <div class="card-bottom flex flex-between flex-items-center ">
            <div class="">
              <h6 class="inline">{user.username}</h6>
              <p>
                <Icon icon="entypo:wallet" class="inline-block" />
                {String(
                  "0x3227edf3d8ef577170f339689a128ce229dd8df2"
                ).substring(0, 6) +
                  "..." +
                  String(
                    "0x3227edf3d8ef577170f339689a128ce229dd8df2"
                  ).substring(38)}
              </p>
            </div>
            <Icon icon="ci:share" width="30" />
          </div>
        </div>
      {/each}
    </div>
  </div>
</section>