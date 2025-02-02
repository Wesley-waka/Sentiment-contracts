// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FeedbackStorage {
    struct Sentiment {
        int256 score;
        uint256 numWords;
        uint256 numHits;
        uint256 average;
        string sentimentType;
        string locale;
        string vote;
    }

    struct Feedback {
        string text;
        Sentiment[] sentiments;
        address user;
    }

    Feedback[] public feedbacks;

    function addFeedback(
        string memory _text,
        int256[] memory _scores,
        uint256[] memory _numWords,
        uint256[] memory _numHits,
        uint256[] memory _averages,
        string[] memory _types,
        string[] memory _locales,
        string[] memory _votes
    ) public {
        require(
            _scores.length == _numWords.length &&
                _numWords.length == _numHits.length &&
                _numHits.length == _averages.length &&
                _averages.length == _types.length &&
                _types.length == _locales.length &&
                _locales.length == _votes.length,
            "Input arrays must have the same length"
        );

        // Create a new Feedback struct
        Feedback storage newFeedback = feedbacks.push();
        newFeedback.text = _text;
        newFeedback.user = msg.sender;

        // Add sentiments to the new feedback
        for (uint256 i = 0; i < _scores.length; i++) {
            newFeedback.sentiments.push(
                Sentiment({
                    score: _scores[i],
                    numWords: _numWords[i],
                    numHits: _numHits[i],
                    average: _averages[i],
                    sentimentType: _types[i],
                    locale: _locales[i],
                    vote: _votes[i]
                })
            );
        }
    }

    function getFeedback(
        uint256 index
    ) public view returns (string memory, Sentiment[] memory, address) {
        require(index < feedbacks.length, "Feedback does not exist.");
        Feedback storage feedback = feedbacks[index];
        return (feedback.text, feedback.sentiments, feedback.user);
    }
}
