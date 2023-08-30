
@program_id("F1ipperKF9EfD821ZbbYjS319LXYiBmjhzkkf5a26rC")
// contract scoreboard {
//     bool private value = true;

//     @payer(payer)
//     constructor(address payer) {
//         print("Hello, World!");
//     }

//     /// A message that can be called on instantiated contracts.
//     /// This one flips the value of the stored `bool` from `true`
//     /// to `false` and vice versa.
//     function flip() public {
//             value = !value;
//     }

//     /// Simply returns the current value of our `bool`.
//     function get() public view returns (bool) {
//             return value;
//     }
// }

contract scoreboard {
    // 1 - Define the data struct that will be stored in the account
    UserScore private accountData;
    
    struct UserScore {
        address player;
        uint64 currentScore;
        uint64 highestScore;
        bytes1 bump;
    }


    // 2 - Definite our account initializer
    @payer(payer)
    @seed("seed")
    constructor(
        @seed bytes payer,
        @bump bytes1 bump,
        address player
    ) {
        print("New QuickNode UserScore account initialized");
        accountData = UserScore (player, 0, 0, bump);
    }

    // 3 - Add functions to interact with the data
    function addPoints(uint8 numPoints) public {
        require(numPoints > 0 && numPoints < 100, 'INVALID_POINTS');
        accountData.currentScore += numPoints;
        if (accountData.currentScore > accountData.highestScore) {
            accountData.highestScore = accountData.currentScore;
        }
    }

    function resetScore() public {
        accountData.currentScore = 0;
    }
    /// 
    ///
}
