// SPDX-License-Identifier: MIT 
pragma solidity >= 0.7.0 < 0.9.0; // ^0.8.17 : 0.8.17 이상

/* 
 * 구조체(struct)
 * Storage, Memory, Calldata의 차이
 * calldata 키워드의 의미는 Data field에 포함된 데이터를 그대로 사용하겠다는 말이고, memory 키워드는 Data field를 통해 가져온 데이터에 대한 복사본을 만들어서 사용하겠다는 말이 된다.
 *
 * 요약
 * 상태 변수의 변경이 블록체인에 저장되어야 한다면 storage 키워드를 사용한다.
 * 블록체인으로의 상태 변수 업데이트가 필요 없다면 memory, calldata를 사용한다. 단 변수 값의 수정이 이루어지지 않는 단순 읽기만 요구된다면, 가스비 절약을 위해서라도 calldata를 사용하는 것이 더 바람직하다.
 * (추가) calldata는 함수의 리턴값에서는 사용할 수 없다. 오직 인풋 파라미터에서만 사용가능하다.
 */

contract Todos  {

    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) public {
       
        // 초기화 case 1 : calling it like a function
        todos.push(Todo(_text, false));

        // 초기화 case 2 : key value mapping
        todos.push(Todo({text: _text, completed: false}));

        // 초기화 case 3 : initialize an empty struct and then update it
        Todo memory todo;
        todo.text = _text;
        // todo.completed initialized to false
        todos.push(todo);
    }

    // Solidity automatically created a getter for 'todos' so
    // you don't actually need this function.
    function get(uint _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // update text
    function updateText(uint _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // update completed
    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }    
}
