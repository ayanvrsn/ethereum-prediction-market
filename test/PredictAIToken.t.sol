// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import {PredictAIToken} from "src/token/PredictAIToken.sol";

contract PredictAITokenTest is Test {
    PredictAIToken token;

    address alice = address(1);

    function setUp() public {
        token = new PredictAIToken();
    }

    function testInitialSupply() public {
        assertEq(token.totalSupply(), 1_000_000 ether);
    }

    function testMint() public {
        token.mint(alice, 100 ether);

        assertEq(token.balanceOf(alice), 100 ether);
    }

    function testVotingPower() public {
        token.transfer(alice, 100 ether);

        vm.prank(alice);

        token.delegate(alice);

        assertEq(token.getVotes(alice), 100 ether);
    }
}
