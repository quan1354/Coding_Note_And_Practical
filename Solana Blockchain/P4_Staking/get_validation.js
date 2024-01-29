const {Connection, clusterApiUrl} = require("@solana/web3.js");

const main = async () =>{
    const connection = new Connection(clusterApiUrl("devnet"), "processed");
    const {current, delinquest} = await connection.getVoteAccounts();

    console.log("All Validator:" + current.concat(delinquest).length);
    console.log("Current Validator:" + current.length);
    console.log(current[0]);
}

const runMain = async() =>{
    try{
        main();
    }catch(err){
        console.error(err);
    }
}

runMain();