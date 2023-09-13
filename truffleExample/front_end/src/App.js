import React, { useState, useEffect, useCallback } from 'react'
import styled from "styled-components";
import Web3 from "web3";
import Simple from "./abis/Simple.json";
import Simple4 from "./abis/Simple4.json";


const Appp = () => {

  const [web3, setWeb3] = useState(null);
  const [return5Value, setReturn5Value] = useState(9);
  const [num, setNum] = useState(0);



  useEffect(() => {
    window.ethereum.on("accountsChanged", (accounts) => {
      console.log(`accountsChanged : ${accounts}`);
    });

    window.ethereum.on("chainChanged", async (chainId) => {
      
      console.log(`chainChanged : ${chainId}`);
      console.log(`window.ethereum.networkVersion : ${window.ethereum.networkVersion}`);

      // if (window.ethereum.networkVersion !== 1337) {
      //   await window.ethereum.request({
      //     method: "wallet_switchEthereumChain",
      //     params: [{ chainId: "0x539" }],
      //   });
      // }
    });
  }, []);
  
  
  
  const metamaskConnection = useCallback(async () => {
    if (window.ethereum) {
      const web3Instance = new Web3(window.ethereum);
      setWeb3(web3Instance);
      try {
        //   if (window.ethereum.networkVersion !== 1337) {
        // await window.ethereum.request({
        //   method: "wallet_switchEthereumChain",
        //   params: [{ chainId: "0x539" }],
        // });
        //   }

        const accounts = await window.ethereum.request({
          method: "eth_requestAccounts",
        });
        console.log(`accounts : ${accounts}`)
      } catch (error) {
        console.error(`Error:${error}`);
      }
    } else if (window.web3) {//메타마스크 구버젼을 위해
      const web3Instance = new Web3(window.web3.currentProvider);
      setWeb3(web3Instance);
    } else {
      console.log("MetaMask should be installed!");
    }
  }, [])


  const showReturn5 = useCallback(async () => {
    const networkId = await web3.eth.net.getId();
    console.log("networkId:", networkId);
    const simpleAddress = Simple.networks[networkId] && Simple.networks[networkId].address;
    let simpleContract = new web3.eth.Contract(Simple.abi, simpleAddress);
    let value = await simpleContract.methods.return5().call();
    setReturn5Value(value);
  }, [web3]);



  const setUpSimple4 = useCallback(async () => { }, []);

  const SetnumFromJS = useCallback(async () => {
    const networkId = await web3.eth.net.getId();
    const simpleAddress = Simple4.networks[networkId] && Simple4.networks[networkId].address;
    let simpleContract = new web3.eth.Contract(Simple4.abi, simpleAddress);
    console.log(window.ethereum.selectedAddress);

    const account = window.ethereum.selectedAddress;

    // Setnum 호출
    await simpleContract.methods.Setnum(99).send({ from: account });

    // Setnum 호출해서 setting된값 조회
    let value = await simpleContract.methods.num().call();
    setNum(value);
  }, [web3]);


  const Setnum2FromJS = useCallback(async () => {
    const networkId = await web3.eth.net.getId();
    const simpleAddress = Simple4.networks[networkId] && Simple4.networks[networkId].address;
    let simpleContract = new web3.eth.Contract(Simple4.abi, simpleAddress);
    console.log(window.ethereum.selectedAddress);

    const account = window.ethereum.selectedAddress;
    // Setnum2 호출하면서 & 1 eth 전송
    const log = await simpleContract.methods.Setnum2(991).send({ from: account, value: web3.utils.toWei("1", "ether") });
    console.log(log);

    let info = await simpleContract.getPastEvents("FromWho", { //allEvents
      filter: { from: "0xf53cCa144C1607269390AC2c5dB1a048B37ce44d" },
      fromBlock: 0,
      toBlock: "latest",
    });
    console.log(info);

    let value = await simpleContract.methods.num().call();
    setNum(value);
  }, [web3]);


  // const [value, setValue] = useState("aaa");

  // useEffect(async () => {
  //   console.log(`useEffect!!!!!!!!!!!!!`);
  // }, []);


  // const onIncrease = useCallback((_val) => {
  //   console.log(`onIncrease~~~~~~~~~~`);
  //   setValue('onIncrease');
  // }, [value]);









  return (
    <Wrapper>
      <Title>Metamask</Title>
      <Title>return5Value(Simple) : {return5Value}</Title>
      <Title>num(Simple4) : {num}</Title>
      <ButtonStyle>
        <button onClick={metamaskConnection}>Connect</button>
        <button onClick={showReturn5}>showReturn5</button>
        <button onClick={SetnumFromJS}>SetnumFromJS</button>
        <button onClick={Setnum2FromJS}>Setnum2FromJS</button>
      </ButtonStyle>
    </Wrapper>
  )
}




const Wrapper = styled.div`
  padding: 4em;
  background: papayawhip;
`;

const Title = styled.div`
  font-size: 1.5em;
  text-align: center;
  color: palevioletred;
`;

const ButtonStyle = styled.div`
  text-align: center;
`;

export default Appp