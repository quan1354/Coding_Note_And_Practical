const{ Connection, clusterApiUrl, LAMPORTS_PER_SOL, Keypair, StakeProgram, Authorized, Lockup, sendAndConfirmTransaction, PublicKey} = require("@solana/web3.js")

const main = async() => {
    const connection = new Connection(clusterApiUrl("devnet"), "processed");
    const STAKE_PROGRAM_ID = new PublicKey("Stake11111111111111111111111111111111111111");
    // stake account delegated ID
    const VOTE_PUB_KEY = ""

    const accounts = await connection.getParsedProgramAccounts(
        STAKE_PROGRAM_ID,{
            filter:[
                { dataSize: 200},
                {
                    memcmp:{
                        offset: 124,
                        bytes: VOTE_PUB_KEY,
                    },
                },
            ],
        }
    );

    console.log(`Total Number of delegators found for ${VOTE_PUB_KEY} is ${accounts.length}`);
    if(accounts.length){
        console.log(`Sample delegator: ${JSON.stringify(accounts[0])}`)
    }
}

const runMain = async() =>{
    try{
        main();
    }catch(err){
        console.error(err);
    }
}

runMain();