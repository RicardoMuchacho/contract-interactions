
## Block 4 - Smart contract connection
---------------------------------------

- ### Contract Connection 

Para hacer contracts como objetos se necesitan 2 cosas:

Interfaz: solo contiene funciones external
Address: contrato que sera el objeto

Projecto: setear variable resultado desde una funcion addition de otro smart contract

Part2: add admin security and fees, msg.sender
Part3: try tx.origin and difference with msg.sender

- ### Error handling

require           - consume mas gas
if + custom error - normal recomendada
if + revert       - normal recomendado

- ### Receiving Native tokens and ERC20

There are 4 ways that a SC can receive ETH: Payable, self destruct, fallback, receive

send() and transfer() have a cap of 2300 gas so call() is prefered to transact ether.

call():
  calls directly a function of other SC without an interface. doesnt revert(), has to revert manually after success. 
  Prefered for sending eth between SC, if no data is send it defaults to an ETH transfer
  Structure = recipient + call + {value: eth} + data (function signature, empty when no function wants to be call just send ether)

fallback():
  called when msg.data is not empty (like in the call "") or the function signature doesn't exist or there is no receive()

receive() - more common than fallback:
  called when msg.data is empty 

- ### Final Project

receive and fallback functions test on the PayableContract

Caller contract that uses call() function to interact with the PayableContract without an interface
