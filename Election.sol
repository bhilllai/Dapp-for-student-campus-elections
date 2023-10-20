
pragma solidity >=0.4.22 <=0.8.12;

contract Election {

    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
        string add;
        string phone;
    }
     struct Voter{
        uint256 id;
        address voterAcc;
        string Name;
        string Hostel;
        string studentID;
        bool voted;
    }
    mapping(address => bool) public voters;
    
    mapping(uint256 => Candidate) public candidates;
    mapping(uint256=>Voter) public voters1;

    uint256 public candidatesCount;
    uint256 public VotersCount;

    event votedEvent(uint256 indexed _candidateId);

    constructor() public {
    }

    function addCandidate(string memory _name,string memory _add,string memory _phone) public {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0, _add, _phone);
    }
    function addVoter(string memory _name,string memory _add,string memory _sid,address _add1) public {
        VotersCount++;
        voters1[VotersCount] = Voter(VotersCount,_add1, _name,_add, _sid,false);
    }

    function vote(uint256 _cid) public {
        require(!voters[msg.sender]);
        require(_cid > 0 && _cid <= candidatesCount);
        voters[msg.sender] = true;
        candidates[_cid].voteCount++;
        emit votedEvent(_cid);
    }
}
