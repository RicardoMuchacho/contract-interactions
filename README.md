# Contract Interactions ⚙️💰

The projects in this repository demonstrates:

- **Connecting contracts using interfaces**: Demonstrates how a `Addition` contract can interact with a `Result` contract by defining and implementing an interface, ensuring a structured and secure interaction between smart contracts.
- **Using payable functions and handling ETH**: Covers good practices for receiving, storing, and transferring ETH in smart contracts. 
- **Testing `receive` and `fallback` functions:** In a dedicated `PayableContract`.
- **Using a Caller Contract:** This contract leverages the `call()` function to interact with the `PayableContract` without using an interface. It illustrates the dynamic interaction between contracts and how to manage ETH transfers and event emissions.

---

## Features Implemented and Notes 📌

- [Contract Interactions ⚙️💰](#contract-interactions-️)
  - [Features Implemented and Notes 📌](#features-implemented-and-notes-)
  - [Contract Connection 🔌](#contract-connection-)
  - [Error Handling ⚠️](#error-handling-️)
  - [Receiving Native Tokens and ERC20 💸](#receiving-native-tokens-and-erc20-)
    - [Sending ETH Between Contracts 🔄](#sending-eth-between-contracts-)
    - [Fallback vs. Receive ⚖️](#fallback-vs-receive-️)

---

## Contract Connection 🔌

When working with smart contracts as objects, there are two key components required:

- **Interface:** Contains only external functions.
- **Address:** The contract's address that serves as the object instance.

Example Project: 
- **Objective:** Set a variable with the result from an addition function of another smart contract.
- **Enhancements:**
  - **Part 2:** Add admin security and fees (using `msg.sender`).
  - **Part 3:** Experiment with `tx.origin` and compare it with `msg.sender`.

---

## Error Handling ⚠️

Different methods for error handling in Solidity have trade-offs in gas consumption and clarity:

- **`require`:** Consumes more gas.
- **`if` with custom error:** Recommended for clarity and gas efficiency.
- **`if` with `revert`:** Also a common and recommended pattern.

---

## Receiving Native Tokens and ERC20 💸

A smart contract can receive ETH in four different ways:

1. **Payable functions:** Directly receiving ETH.
2. **Self-destruct:** Contract destruction sends ETH to an address.
3. **Fallback:** Triggered when no matching function exists or when calldata is sent with ETH.
4. **Receive:** More common; triggered when no data is sent.

### Sending ETH Between Contracts 🔄

- **`send()` and `transfer()`:** Limit of 2300 gas; may fail if more gas is required.
- **`call()`:** Preferred for transferring ETH because:
  - It directly calls a function of another contract without needing an interface.
  - It does not revert automatically; you must handle errors manually.
  - When no data is sent, it defaults to an ETH transfer.
  - **Structure:** Recipient + `call` + `{value: eth}` + data (function signature, empty when only sending ETH).

### Fallback vs. Receive ⚖️

- **`fallback()`:** Invoked when `msg.data` is not empty or if the function signature doesn’t exist.
- **`receive()`:** Called when `msg.data` is empty and is generally more common than the fallback function.