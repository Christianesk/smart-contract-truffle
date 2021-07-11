// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract UsersContract {
    struct User {
        string name;
        string surName;
    }

    mapping(address => User) private users;
    mapping(address => bool) private joinedUsers;
    address[] total;

    function join(string memory name, string memory surName) public {
        require(!userJoined(msg.sender), 'Ya existe el usuario');
        User storage user = users[msg.sender];
        user.name = name;
        user.surName = surName;
        joinedUsers[msg.sender] = true;
        total.push(msg.sender);
    }

    function getUser(address addr)
        public
        view
        returns (string memory, string memory)
    {
        require(userJoined(msg.sender),'No existe el usuario');
        User memory user = users[addr];
        return (user.name, user.surName);
    }

    function userJoined(address addr) private view returns (bool) {
        return joinedUsers[addr];
    }

    function totalUsers() public view returns (uint){
        return total.length;
    }
}
