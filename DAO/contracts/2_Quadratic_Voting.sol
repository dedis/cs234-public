// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract Flavors {
    mapping(string => uint32) proposalIndices;
    uint32 numProposals = 4;
    // The tokens we've given to each participant
    mapping(address => uint32) tokens;
    mapping(address => bool) tokensMinted;
    // The votes that each proposal has gotten
    mapping(uint32 => uint32) proposals;
    mapping(address => mapping(uint32 => uint32)) votesByFor;

    constructor() {
        proposalIndices["nothing"] = 0;
        proposalIndices["mint"] = 1;
        proposalIndices["chocolate"] = 2;
        proposalIndices["vanilla"] = 3;
        
        proposals[0] = 2;
    }
    
    function mintTokens() public {
        require(!tokensMinted[msg.sender], "can't mint tokens twice");
        tokens[msg.sender] = 9;
        tokensMinted[msg.sender] = true;
    }
    
    function myTokens() public view returns(uint32) {
        return tokens[msg.sender];
    }

    function voteFor(string memory proposal) public {
        // Will be Nothing if not present
        uint32 i = proposalIndices[proposal];
        require(
            tokens[msg.sender] >= 1,
            "You need to have a token to vote with"
        );
        uint32 n = votesByFor[msg.sender][i] + 1;
        // This makes it so that for N votes, we need to have spent a total of N^2 tokens
        uint32 required = 2 * n - 1;
        require(tokens[msg.sender] >= required, "Insufficient tokens");

        tokens[msg.sender] -= required;
        votesByFor[msg.sender][i] = n;
        proposals[i] += 1;
    }

    // This will take away all votes that the user has allocated so far
    function resetMyVotes() public {
        for (uint32 i = 0; i < numProposals; ++i) {
            uint32 n = votesByFor[msg.sender][i];
            tokens[msg.sender] += n * n;
            proposals[i] -= n;
            votesByFor[msg.sender][i] = 0;
        }
    }

    function myVotes(string memory proposal) public view returns(uint32 votes) {
        uint32 i = proposalIndices[proposal];
        return votesByFor[msg.sender][i];
    }
    
    function getVotes(string memory proposal) public view returns(uint32 votes) {
        return proposals[proposalIndices[proposal]];
    }
    
    function winner() public view returns (string memory) {
        uint32 maxI = 0;
        uint32 max = proposals[0];
        for (uint32 i = 1; i < numProposals; i++) {
            if (proposals[i] > max) {
                max = proposals[i];
                maxI = i;
            }
        }
        if (maxI == 1) {
            return "mint";
        }
        if (maxI == 2) {
            return "chocolate";
        }
        if (maxI == 3) {
            return "vanilla";
        }
        return "nothing";
    }
}

