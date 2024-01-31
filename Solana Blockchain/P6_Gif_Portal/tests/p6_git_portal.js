const anchor = require("@project-serum/anchor");

const main = async () => {
  console.log("Start Test")
  const provider = anchor.Provider.env()
  anchor.setProvider(provider)
  const program = anchor.workspace.P6_Git_Portal

  const baseAccount = anchor.web3.Keypair.generate()
  const tx = await program.rpc.startStuffOff({
    accounts:{
      baseAccount: baseAccount.publicKey,
      user: provider.wallet.publicKey,
      systemProgram: anchor.web3.SystemProgram.programId,
    },
    signers:[baseAccount],
  });
  console.log("Signature:", tx)

  let account = await program.account.baseAccount.fetch(
    baseAccount.publicKey
  );
  console.log("GIF count", account.total_gifs.toString())

  await program.rpc.addGif(
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.com%2Ffree-photos-vectors%2Fcat&psig=AOvVaw3b4uCD7Kp3gjGxhJGm331N&ust=1706779499718000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCID1lqCnh4QDFQAAAAAdAAAAABAE",
    {
      accounts:{
        baseAccount: baseAccount.publicKey,
        user: provider.wallet.publicKey,
      }
    }
  );

  account = await program.account.baseAccount.fetch(baseAccount.publicKey)
  console.log("GIF count", account.total_gifs.toString())
  console.log("GIF List", account.gifList)
}

const runMain = async () => {
  try{
    await main();
    process.exit(0);
  }catch(error){
    console.log(error);
    process.exit(1);
  }
};

runMain()