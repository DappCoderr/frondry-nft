//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {BasicNFT} from "src/BasicNFT.sol";
import {DeployBasicNFT} from "script/DeployBasicNFT.s.sol";

contract BasicNFTTest is Test{
    DeployBasicNFT public deployer;
    BasicNFT public basicNFT;
    address public BOB = makeAddr("Bob");
    string constant public PUB_URI = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setup() public {
        deployer = new DeployBasicNFT();
        basicNFT = deployer.run();
    }

    // function testNameIsCorrect() public view {
    //     // vm.prank(bob);
    //     string memory expectedName = "togie";
    //     string memory actualName = basicNFT.name();
    //     assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
    // }

    function testMintandHaveBalance() public {
        vm.prank(BOB);
        basicNFT.mint(PUB_URI);
        assert(basicNFT.balanceOf(BOB) == 1);
        assert(keccak256(abi.encodePacked(PUB_URI)) == keccak256(abi.encodePacked(basicNFT.tokenURI(0))));
    } 
}