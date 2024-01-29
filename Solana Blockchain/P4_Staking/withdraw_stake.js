const { Connection, clusterApiUrl, LAMPORTS_PER_SOL, Keypair, StakeProgram, Authorized, Lockup, sendAndConfirmTransaction, PublicKey } = require("@solana/web3.js")

const main = async () => {
    const connection = new Connection(clusterApiUrl("devnet"), "processed");
    const wallet = Keypair.generate();
    const airdropSignature = await connection.requestAirdrop(wallet.publicKey, 1 * LAMPORTS_PER_SOL);
    await connection.confirmTransaction(airdropSignature);
    const balance = await connection.getBalance(wallet.publicKey);
    console.log(balance);

    const stakeAccount = Keypair.generate()
    const minimumRent = await connection.getMinimumBalanceForRentExemption(StakeProgram.space)
    const amountUserWantsToStake = 0.5 * LAMPORTS_PER_SOL
    const amountToStake = minimumRent + amountUserWantsToStake
    const createStakeAccountx = StakeProgram.createAccount({
        authorized: new Authorized(wallet.publicKey, wallet.publicKey),
        fromPubkey: wallet.publicKey,
        lamports: amountToStake,
        lockup: new Lockup(0, 0, wallet.publicKey),
        stakePubkey: stakeAccount.publicKey
    })
    const createStakeAccountTxId = await sendAndConfirmTransaction(connection, createStakeAccountx, [wallet, stakeAccount])

    console.log(`Stake account created. Tx Id: ${createStakeAccountTxId}`)
    let stakeBalance = await connection.getBalance(stakeAccount.publicKey)
    console.log(`Stake account balance: ${stakeBalance / LAMPORTS_PER_SOL} SOL`)

    let stakeStatus = await connection.getStakeActivation(stakeAccount.publicKey)
    console.log(`Stake account status: ${stakeStatus.state}`)

    const validators = await connection.getVoteAccounts();
    const selectedValidator = validators.current[0];
    const selectedValidatorPubKey = new PublicKey(selectedValidator.votePubkey);
    const delegateTx = StakeProgram.delegate({
        stakePubkey: stakeAccount.publicKey,
        authorizedPubkey: wallet.publicKey,
        votePubkey: selectedValidatorPubKey,
    });

    const delegateTxId = await sendAndConfirmTransaction(connection, delegateTx, [wallet])
    console.log(`Stake account delegated to ${selectedValidatorPubKey}. Tx Id ${delegateTxId}`)
    const deactivateTx = StakeProgram.deactivate({ stakePubkey: stakeAccount.publicKey, authorizedPubkey: wallet.publicKey })
    const deactivateTxId = await sendAndConfirmTransaction(connection, deactivateTx, [wallet])
    console.log(`Stake account deactivated. Tx Id: ${deactivateTxId}`)

    stakeStatus = await connection.getStakeActivation(stakeAccount.publicKey);
    console.log(`Stake account status: ${stakeStatus.state}`)


    const withdrawTx = StakeProgram.withdraw({statePubKey: stakeAccount.publicKey, authorizedPubkey: wallet.publicKey, toPubkey: wallet.publicKey, lamports: stakeBalance})
    const withdrawTxId = await sendAndConfirmTransaction(connection, withdrawTx, [wallet])
    console.log(`Stake account withrawn. Tx Id: ${withdrawTx}`)
    stakeBalance = await connection.getBalance(stakeAccount.publicKey)
    console.log(`Stake account balance: ${stakeBalance / LAMPORTS_PER_SOL} SOL`)
}

const runMain = async () => {
    try {
        main();
    } catch (err) {
        console.error(err);
    }
}

runMain();