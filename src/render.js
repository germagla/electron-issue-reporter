
let nameObjects = []; 
const nameInput = document.querySelector('.nameInput');
const nameDatalist = document.querySelector('#nameDatalist');
const mysql = require('mysql');
const ipcRenderer = require('electron').ipcRenderer;

const dbConnection1  = mysql.createConnection({
    host: "localhost",
    user: "grace",
    password: "grace",
    database: "form_prototype"
})


dbConnection1.connect((err)=> {
    if (err){
        return console.log(err.stack);
    }
    console.log("Reading Database...")
})

let queryString="SELECT * FROM `Employees`";
dbConnection1.query(queryString,(err, rows, fields) =>{
    if (err){
        return console.log("An error occured with the query", err);
    }

    nameObjects = rows;
    console.log(nameObjects);
})

dbConnection1.end(()=> console.log("Connection closed"));


nameInput.addEventListener('keypress', function(){
  let input = nameInput.value;
  nameDatalist.innerHTML = '';
  
  suggestions = nameObjects.filter((nameObject) => {
      return nameObject.employee_name.toLowerCase().startsWith(input)||nameObject.employee_name.startsWith(input);
  })
  console.log(suggestions);
  suggestions.forEach(element => {
      let div = document.createElement('option');
      div.innerHTML = element.employee_name;
      nameDatalist.appendChild(div);
  });
})

//document.getElementById("form").onsubmit = sendForm;

function sendForm(that,event) {
    event.preventDefault();
    const dbConnection2  = mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "root",
        database: "form_prototype"
    })
    dbConnection2.connect((err)=> {
        if (err){
            return console.log(err.stack);
        }
        console.log("Reading Database...")
    })
    
    let queryString=`INSERT INTO Issues (employee_id,date,issue) VALUES ('00000','${that.date.value}','${that.issue.value}');`;
    dbConnection2.query(queryString,(err, rows, fields) => {
        if (err){
            return console.log("An error occured with the query", err);
        }
    
    })
    
    dbConnection2.end(()=> console.log("Connection closed"));
    
    that.reset();
    //let name = that.name.value;
    //ipcRenderer.send('form-submission', name);

}

