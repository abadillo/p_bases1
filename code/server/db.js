const Pool = require("pg").Pool;

const pool = new Pool({

    user: "postgres",
    password: "112358",
    host: "localhost",
    port: 5433,
    database: "test"

});

module.exports = pool;