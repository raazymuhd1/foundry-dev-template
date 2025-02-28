// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import { Test, console } from "forge-std/Test.sol";
import { CCRelayer } from "../../src/base/CCRelayer.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract CCRelayerTest is Test {

    CCRelayer ccRelayer;

    address ccipRouter = 0x80226fc0Ee2b096224EeAc085Bb9a8cba1146f7D;
    address linkToken = 0x514910771AF9Ca656af840dff83E8264EcF986CA;
    address USER = 0xA023f08c70A23aBc7EdFc5B6b5E171d78dFc947e;

    uint64 baseChainSelector = 15971525489660198786;
    uint64 mainnetChainSelector = 5009297550715157269;

    function setUp() public {
        vm.startPrank(USER);
        ccRelayer = new CCRelayer(ccipRouter, linkToken);
        IERC20(linkToken).transfer(address(ccRelayer), 100 ether);
        (bool success, ) = address(ccRelayer).call{value: 1 ether}("");
        vm.stopPrank();
    }

    function test_sendTokenCCPayLink() public {
         uint256 amount = 20 ether;

         vm.startPrank(USER);
         ccRelayer.allowlistDestinationChain(baseChainSelector, true);
         ccRelayer.allowlistDestinationChain(mainnetChainSelector, true);
         IERC20(linkToken).approve(address(ccRelayer), amount);
         ccRelayer.transferTokensPayLINK(baseChainSelector, USER, linkToken, amount);
         vm.stopPrank();

         console.log("sent");
    }
}