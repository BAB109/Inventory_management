const {Pool} = require('pg')
require('dotenv').config()
const pool=new Pool({
    user:process.env.DB_USER || 'postgres',
    host:process.env.DB_HOST || 'postgres',
    database:process.env.DB_NAME || 'scrap_log',
    password:process.env.DB_PASSWORD,
    port:process.env.DB_PORT
})
module.exports=pool