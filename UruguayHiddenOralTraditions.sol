// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Uruguay Hidden Oral Traditions Registry
/// @notice On-chain registry of real, lesser-known rural oral traditions and gaucho knowledge from Uruguay, with community voting.
/// @dev Country-specific: focused on Uruguay's countryside identity, oral memory, and intergenerational transmission.

contract UruguayHiddenOralTraditions {

    struct Tradition {
        string region;          // e.g., Tacuarembo, Cerro Largo, Rocha
        string town;            // specific locality or rural community
        string traditionName;   // name of the oral tradition or practice
        string practiceType;    // e.g., payada style, herbal knowledge, rural craft
        string culturalNote;    // brief factual context or origin
        string whyItMatters;    // cultural significance
        address creator;
        uint256 likes;
        uint256 dislikes;
        uint256 createdAt;
    }

    Tradition[] public traditions;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event TraditionRecorded(uint256 indexed id, string traditionName, string town, address indexed creator);
    event TraditionVoted(uint256 indexed id, bool like, uint256 likes, uint256 dislikes);

    constructor() {
        traditions.push(
            Tradition({
                region: "Tacuarembo",
                town: "ExampleTown",
                traditionName: "Example Tradition (replace with real entries)",
                practiceType: "example type",
                culturalNote: "This is an example entry to illustrate the format.",
                whyItMatters: "Real entries should describe cultural and oral relevance.",
                creator: address(0),
                likes: 0,
                dislikes: 0,
                createdAt: block.timestamp
            })
        );
    }

    /// @notice Record a new hidden oral tradition from Uruguay.
    function recordTradition(
        string calldata region,
        string calldata town,
        string calldata traditionName,
        string calldata practiceType,
        string calldata culturalNote,
        string calldata whyItMatters
    ) external {
        require(bytes(region).length > 0, "Region required");
        require(bytes(town).length > 0, "Town required");
        require(bytes(traditionName).length > 0, "Tradition name required");

        traditions.push(
            Tradition({
                region: region,
                town: town,
                traditionName: traditionName,
                practiceType: practiceType,
                culturalNote: culturalNote,
                whyItMatters: whyItMatters,
                creator: msg.sender,
                likes: 0,
                dislikes: 0,
                createdAt: block.timestamp
            })
        );

        emit TraditionRecorded(traditions.length - 1, traditionName, town, msg.sender);
    }

    /// @notice Vote on whether a recorded tradition is culturally relevant or useful.
    function voteTradition(uint256 id, bool like) external {
        require(id < traditions.length, "Invalid ID");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        Tradition storage t = traditions[id];

        if (like) {
            t.likes += 1;
        } else {
            t.dislikes += 1;
        }

        emit TraditionVoted(id, like, t.likes, t.dislikes);
    }

    /// @notice Returns the total number of recorded traditions.
    function totalTraditions() external view returns (uint256) {
        return traditions.length;
    }
}
