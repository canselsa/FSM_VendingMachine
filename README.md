# FSM_VendingMachine

We have a vending machine that sells Pringles cans that costs 2$ each. Besides, the machine only accepts three types of coins: 1$, 2$, and 5$. 

Notes: You can assume there is an infinite number of cans in the machine stock. You can also assume that you can input one type of coin at every deposit. 
(You cannot deposit 1$ AND 5$ at the same time.)

Cases: 
 1) You input NO coin.
 2) Putting 1$ followed by another 1$ => getting the can
 3) Putting 1$ followed by 2$ => receive the change => getting the can
 4) Putting 1$ followed by 5$ => receive the change => getting the can
 5) Putting 2$ => getting the can 6) Putting 5$ => receive the change => getting the can.

Input and Outputs:
- CLK (Clock): a clock that will run the FSM 
- Reset: a signal that will reset the FSM to its initial state 
- MoneyIn: Input amount 
- Total: Sum of the money inside the machine 
- Pringles: Pringles can given to the customer 
- Change: Money amount of given to the customer

States: 
- start: Initial step of the process 
- hold: Waiting input from customer 
- pringles_dispense: dispensing out the Pringles can
- money_1,money_2,money_3,money_5,money_6: the money which is in the FSM machine
- signal now_state,next_state: state_type; current and next state declaration



