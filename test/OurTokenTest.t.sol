// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {OurToken} from "../src/OurToken.sol";

contract OurTokenTest is Test {
    uint256 STARTING_BALANCE = 1 ether;

    OurToken public ourToken;
    DeployOurToken public deployer;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    function setUp() public {
        deployer = new DeployOurToken();
        ourToken = deployer.run();

        vm.prank(address(deployer));
        ourToken.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public {
        console.log("Bob's balance:", ourToken.balanceOf(bob));
        assertEq(STARTING_BALANCE, ourToken.balanceOf(bob));
    }
}
