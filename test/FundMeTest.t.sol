//SPDX-LICENSE-IDENTIFIER: MIT

pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from '../src/FundMe.sol';
import {DeployFundMe} from '../script/DeployFundMe.s.sol';

contract FundMeTest is Test {
    FundMe fundMe;

    function setUp() external {
        // fundMe = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306); 
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
    }

    function testMinimumDollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testMessageSenderIsOwner() public {
        assertEq(fundMe.i_owner(), msg.sender);
    }
    function testPriceConvertorVersionIsAccurate() public{
        assertEq(fundMe.getVersion(), 4);
    }
}