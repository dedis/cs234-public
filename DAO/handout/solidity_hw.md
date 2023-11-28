# CS-234 Solidity Homework (Part 2)

In Part 2, you will work on a few Ethereum smart
contracts that are written in Solidity to learn the basics about interacting
with smart contracts. For now, you are going to work **individually**. In the second
part of the homework, you will be interacting with your classmates on the same
contract.

To interact with these contracts, we will be using a sandbox: [https://remix.ethereum.org](https://remix.ethereum.org/#version=soljson-v0.8.7+commit.e28d00a7.js&optimize=false&runs=200&gist=9ae094faf74fd94305596dd4db2277f1).
Remix allows you to load a project from different sources. In case you do not
see the contracts named `1_Hello.sol`, `2_Quadratic_Voting.sol` and
`3_Multi_Voting.sol`, you can use the `Clone Git Repository` button next to `Workspaces` and use the following as the git repository URL: https://github.com/dedis/cs234-public/. To follow the HW, you will need to go one directory level deeper by clicking on `DAO`.

## 1: Hello Contract

This contract can be found in `contracts/1_Hello.sol`. This is just a simple contract that stores
a single number that anyone can modify. The first thing we will do is compile the contract. With the contract open, there should be a button to compile it. It looks like a green arrow pointing right. Alternatively, the left toolbar, there is an icon that looks like `S` which also allows you to compile the contract.

After clicking on the button to compile, you can open the deployment tab by
clicking on the fourth item on the same toolbar (it is right under the S-shaped
compiler icon). Here, you can select the `1_Hello.sol` contract, and then deploy
it. This will deploy the contract in a sandbox so that we can interact with it.

After deploying it, you should see it appear under the `Deployed Contracts`
section, which is below the `Deploy` button. After expanding it, you should see
two buttons, corresponding to the different functions in the contract. The first
function lets you modify the number stored in the contract, and the second
function lets you get the current value of the number. Try playing around with
these functions, and then look at how they are implemented in the contract.

## 2: Quadratic Voting

This second contract is in `contracts/2_Quadratic_Voting.sol`. 
This one is a bit more complicated to implement,
but the basic idea is simple. You have a collection of ice cream flavors you can vote
for: `nothing`, `mint`, `chocolate`, and `vanilla`. Currently, `nothing` is in the lead with 2 votes.
The other flavors have no votes so far. Your goal is to make your favorite flavor win, by giving
it 3 votes.

To start with, you can compile and deploy the contract like you did in the previous question.

To vote, you will need to spend tokens. You can get your initial tokens by calling the `mintTokens`
function. This will give you 9 tokens to start with. If you call the function a second time,
it will fail, since you have already minted your tokens. You can check how many tokens
you have with the `myTokens` function.

You can use the `voteFor` function to vote for a specific proposal. If you vote twice for the
same proposal, notice that you only have 5 tokens remaining. This is because this contract
uses quadratic voting. To provide `N` votes for the same proposal, you need to spend `N^2` tokens.

Thankfully, if you change your mind, you can reset your votes with `resetMyVotes`.

You can see how many times you have voted for a specific proposal with the `myVotes` function.
You can also see which proposal is winning with the `winner` function.

Your goal is to bring your favorite flavor into the lead, by giving it at least
3 votes, more than the 2 votes that `nothing` currently has. With the 9 tokens you are given
to start with, is this possible?

## 3: Sybil Problems

This contract is in `contracts/3_Multi_Voting.sol`. The contract functions in the same
way as the last contract, except that `nothing` now starts with 4 votes, instead of 2.
You still only have 9 tokens to start with. Can you make your favorite flavor win now?

Hint: Notice the `Account` field at the top of "Deploy & Run Transactions" section.

## 4: Questions

To test your understanding of the homework, please answer the following questions:

1. If you have voted `n - 1` times for a proposal, how many tokens do you need
   to spend to vote one more time on the same proposal?
2. (a) If instead of making a single proposal of the three win, you want to vote
   as many times for the proposals as possible, what is the best strategy? (b)
   How many votes can you give to each of the three proposals if you use the
   strategy in (a)? (c) Could you vote more times if you had the same number of
   tokens but there were more than three proposals?
3. What would be an approach to address the Sybil problem introduced in section 3?

## 5: What to submit?

You are going to upload __on Moodle__ a PDF document with your answers to the
questions in Section 4. Please carefully label your answers with the corresponding
question numbers (_e.g.,_ 2.a.). Please do not forget to put your name and
SCIPER in the PDF. Your PDF file should be named as follows:
__<YOUR_SCIPER>.pdf__.
