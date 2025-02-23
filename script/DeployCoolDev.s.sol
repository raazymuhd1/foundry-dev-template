// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {CoolDev} from "../src/CoolDev.sol";

contract DeployCoolDev is Script {
    CoolDev public coolDev;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        coolDev = new CoolDev("CoolDev", "CD");
        console.log(address(coolDev));

        vm.stopBroadcast();
    }
}
