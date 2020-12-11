const Pool = require("pg").Pool;

const pool = new Pool({

    user: "grupo4bd1",
    password: "bases1_abgmjd",
    host: "labs-dbservices01.ucab.edu.ve",
    port: 5432,
    database: "grupo4db1_"

});

module.exports = pool;