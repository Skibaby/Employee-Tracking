const inquirer = require('inquirer');
const mysql = require('mysql2');
const cTable = require('console.table');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'employee_db'
});

const questions = [
   { type: "list",
            message: "What do you want to do?",
            name: "options",
            choices: [
                "Add Department",
                "Add Role",
                "Add Employee",
                "View Departments",
                "View Roles",
                "View Employees",
                "Update Employee Role"
            ],
        },
        {
            type: "input",
            message: "Name of Department",
            name: "addDepartment",
            when: (answers) => {
                if (answers.prompt = "Add Department") {
                    return true;
                } else {
                    return false;
                }
            }
        }
]

inquirer
  .prompt(
    /* Pass your questions in here */
   questions
  )
  .then((answers) => {
    // Use user feedback for... whatever!!
    switch (answers.options) {
        case "Add Department":
        console.log("hit dept")
        break;

        default:
            break;
    }
  })
  .catch((error) => {
    if (error.isTtyError) {
      // Prompt couldn't be rendered in the current environment
    } else {
      // Something else went wrong
    }
  });

  
//   connection.query(
//     'SELECT * FROM role',
//     function (err, results, fields) {
//         let resultsTbl = cTable.getTable(results)
//         console.log(`\n${resultsTbl}`); 
//         restart()
//     }
// )