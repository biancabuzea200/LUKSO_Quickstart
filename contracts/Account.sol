// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.4;

// modules
import {LSP0ERC725Account} from "@lukso/lsp0-contracts/contracts/LSP0ERC725Account.sol";

// errors
import {ERC725Y_DataKeysValuesLengthMismatch} from "@erc725/smart-contracts/contracts/errors.sol";

// constants
import {_LSP3_SUPPORTED_STANDARDS_KEY, _LSP3_SUPPORTED_STANDARDS_VALUE} from "@lukso/lsp3-contracts/contracts/LSP3Constants.sol";

/**
 * @title implementation of a LUKSO's Universal Profile based on LSP3
 * @dev Implementation of the ERC725Account + LSP1 universalReceiver
 */
contract UniversalProfile is LSP0ERC725Account {
    /**
     * @notice Deploying the contract with owner set to: `initialOwner`
     * @dev Set `initialOwner` as the contract owner and set the `SupportedStandards:LSP3UniversalProfile` data key
     * in the ERC725Y data key/value store. The `constructor` also allows funding the contract on deployment.
     *
     * Emitted Events:
     * - ValueReceived: when the contract is funded on deployment.
     *
     * @param initialOwner the owner of the contract
     */
    constructor(address initialOwner) payable LSP0ERC725Account(initialOwner) {
        // set data key SupportedStandards:LSP3UniversalProfile
        _setData(
            _LSP3_SUPPORTED_STANDARDS_KEY,
            _LSP3_SUPPORTED_STANDARDS_VALUE
        );
    }

    event ValueReceived(address indexed sender, uint256 value);

    function setData(
        bytes32 dataKey,
        bytes memory dataValue
    ) public payable override {
        if (msg.value != 0) {
            emit ValueReceived(msg.sender, msg.value);
        }
        _setData(dataKey, dataValue);
    }

    function setDataBatch(
        bytes32[] memory dataKeys,
        bytes[] memory dataValues
    ) public payable override {
        if (msg.value != 0) {
            emit ValueReceived(msg.sender, msg.value);
        }

        if (dataKeys.length != dataValues.length) {
            revert ERC725Y_DataKeysValuesLengthMismatch();
        }

        for (uint256 i = 0; i < dataKeys.length; ) {
            _setData(dataKeys[i], dataValues[i]);

            unchecked {
                ++i;
            }
        }
    }
}
