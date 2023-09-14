const inquirer = require('inquirer');
const mysql = require('mysql2');
const cTable = require('console.table');

const prompt = inquirer.createPromptModule();

let db;

const getAll = (tableName) => {

    db.query('SELECT * FROM ??', tableName, (err, results) => {
        if (err) {
            return console.log(err)
        }

        console.table(results); // ADDED THIS LINE
        // console.log(results)
        init();
    });
};

const insertEmployee = (data) => {
    db.query('INSERT INTO employee (first_name, last_name) VALUES(?, ?)', [data.first_name, data.last_name], (err, results) => {
        console.log('add employee');
        init();
    });
};

const addRole = (data) => {
    console.log(data)
    db.query('INSERT INTO role (title, salary, department_id) VALUES(?, ?, ?)', [data.title, data.salary, data.department_id], (err, results) => {
        console.log('add role');
        init();
    });
};

const addDepartment = (data) => {
    console.log(data)
    db.query('INSERT INTO department (name) VALUES(?)', data.name, (err, results) => {
        console.log(`add department ${results}`);
        init();
    });
};

const updateEmployeeRole = async (data) => {
    const namearray = data.fullname.trim().split(" ");

    const [employeeRows, employeefields] = await db.promise().query('SELECT id FROM employee WHERE first_name = ? AND last_name = ?', [namearray[0], namearray[1]]);

    const [rolesRows, rolesfields] = await db.promise().query('SELECT id FROM role WHERE title = ?', [data.title]);
    
    const [updateRows, updateFields] = await db.promise().query('UPDATE employee SET role_id = ? WHERE id = ?', [rolesRows[0].id, employeeRows[0].id]);

    init();
}

const updateEmployeeRoleQuestions = async () => {
    try {
        const [employeeRows, employeefields] = await db.promise().query('SELECT CONCAT(first_name, " ", last_name) AS fullname from employee');

        const [rolesRows, rolesfields] = await db.promise().query('SELECT title FROM role');

        let fullNames = [];
        let rolesTitles = [];

        employeeRows.forEach((row) => {
            fullNames.push(row.fullname);
        });

        rolesRows.forEach((row) => {
            rolesTitles.push(row.title);
        });

        return prompt([
            {
                message: 'Please Select Role to Update',
                type: 'rawlist',
                name: 'fullname',
                choices: fullNames
            },
            {
                message: 'Update Role',
                type: 'rawlist',
                name: 'title',
                choices: rolesTitles,
            },
        ])

    } catch (err) {
        console.log(err);
    }
}

const handleAction = ({ action }) => {

    console.log(`ACTION ${action}`);
    
    switch (action) {
        case 'View employees': {
            getAll('employee');
            console.log('view employees');
            break;
        }

        case 'View departments': {
            getAll('department');
            break;
        }

        case 'View roles': {
            getAll('role');
            break;
        }

        case 'Add employee': {
            prompt([
                {
                    message: 'Please Enter Your First Name',
                    type: 'input',
                    name: 'first_name',
                },
                {
                    message: 'Please Enter Your Last Name',
                    type: 'input',
                    name: 'last_name',
                },
            ]).then(insertEmployee);
            break;
        }

        case 'Add department': {
            prompt([
                {
                    message: 'Please Enter Department Name',
                    type: 'input',
                    name: 'name',
                }
            ]).then(addDepartment);
            break;
        }

        case 'Add role': {
            prompt([
                {
                    message: 'Please Add Role Title',
                    type: 'input',
                    name: 'title',
                },
                {
                    message: 'Please Add Salary',
                    type: 'number',
                    name: 'salary',
                },
                {
                    message: 'Please Select Department ID',
                    type: 'list',
                    name: 'department_id',
                    choices: async () => {
                        try {
                            const [rows, fields] = await db.promise().query('SELECT ?? FROM ??', ["id", "department"]);

                            const deptIds = rows.map((row) => row.id);

                            return deptIds

                        } catch (err) {
                            console.log(err);
                        }
                    }
                },
            ]).then(addRole);
            break;
        }

        case 'Update employee role': {
            updateEmployeeRoleQuestions()
                .then(updateEmployeeRole);
            break;
        }

        default: {
            process.exit();

        }
    }

};

const init = () => {
    prompt({
        message: 'Please Choose One',
        type: 'rawlist',
        name: 'action',
        choices: [
            'View employees',
            'View departments',
            'View roles',
            'Add employee',
            'Add department',
            'Add role',
            'Update employee role',
            'Exit',
        ]
    })
        .then(handleAction);
};

db = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: "",
    database: 'employee_db_2',
}, init());