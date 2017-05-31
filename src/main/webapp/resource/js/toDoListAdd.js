/*var task = document.querySelector('#task');*/
var taskBtn = document.querySelector('#addTaskBtn');

var toDoList = document.querySelector('#toDoList');

//console.log(task);
//console.log(taskBtn);
//console.log(toDoList);



var createNewTask = function(taskEntered) {


	//SET UP THE NEW LIST ITEM
	var listItem = document.createElement("tr"); //<li>
    var numName = document.createElement("td");
    var colTd = document.createElement("td");
	var inputText = document.createElement("input"); //checkbox
    var checkbox = document.createElement("input"); //checkbox


	//PULL THE INPUTED TEXT INTO LABEL AND ADD IT TO THE SPAN

	
	//ADD INPUT TYPE OF CHECKBOX TO THE INPUT
    checkbox.type ="checkbox";
	inputText.type = "text";
	inputText.placeholder = "항목을입력하세요.";
	inputText.name = "select";
    numName.textContent =  (toDoList.children.length +1)+ "번";
	//ADD ITEMS TO THE LI WE JUST CREATED
	listItem.appendChild(numName);
	listItem.appendChild(colTd);
	colTd.appendChild(inputText).className += "box";

	colTd.appendChild(checkbox);
	//EVERYTHING PUT TOGETHER
	return listItem;

};

//console.log(createNewTask("something ELSE"));


var addToTaskList = function() {

    if(toDoList.children.length +1 > 5){
    	alert("그만");
    	return;
    }
	//Grab the inputted task from above and store its value inside 
	//the createNewTask function to allow the list item to be created
	var taskItem = createNewTask(task.value);

	//add the formatted list item to the LIST
	toDoList.appendChild(taskItem);

	//CLEAR THE INPUT
	/*task.value = "";*/

	//BIND THE NEW TASK ITEM
	bindTaskList(taskItem, deleteTask);

};


//ADD TASK BUTTON
taskBtn.addEventListener("click", addToTaskList);

//DELETE TASK FUNCTION

var deleteTask = function() {

	//STORE THE PARENT ITEM THAT THE CHECK BOX IS INSIDE OF
	var listItem = this.parentNode.parentNode;


	//REMOVE THE LIST ITEM
	listItem.remove(listItem);
    
        for (var i = 2; i < toDoList.children.length; i++) {
            toDoList.children[i].getElementsByTagName("td")["0"].innerText = (i + 1) + "번";
           /* console.log(toDoList.children[i].getElementsByTagName("td")["0"].innerText);*/
        /*toDoList.children[i].getAttribute("numName").textContent = "번";*/
    }
};


var bindTaskList = function(taskItem, checkBoxClick) {

	//BIND THE CHECKBOX TO A VAR
	var checkBox = taskItem.querySelector("input[type=checkbox]");

	//SETUP EVENT LISTENER FOR THE CHECKBOX
	checkBox.onchange = checkBoxClick;
};


/*for (var i = 0; i < toDoList.children.length; i++) {
	bindTaskList(toDoList.children[i], deleteTask);
}*/