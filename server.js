const express=require('express')
require("dotenv").config() 
const pool=require('./db')
const { configDotenv } = require('dotenv')
const { Query } = require('pg')
app=express()
// process event handelers
process.on('uncaughtException',(err)=>{
    console.error(err.message)
    process.exit(1)
})
process.on('unhandledRejection',(reason,promise)=>{
    console.error(promise,' reason ',reason)
    process.exit(1)
})

// parser
app.use(express.json());

app.get('/api/categories',async(req,res,next)=>{
    try{
        const result=await pool.query('Select * from metal order by metalid asc')
        res.status(200).json({
            status:'sucess',
            results:result.rowCount,
            data:result.rows
        })
    }
    catch(err){
        next(err)
    }
})

app.get("/api/inventory",async(req,res,next)=>{
    try{
        const result=await pool.query('select metal.metalname,quality.qualityname,weight from inventory INNER JOIN metal ON inventory.metalid=metal.metalid INNER JOIN quality ON inventory.qualityid=quality.qualityid')
        res.status(200).json({
            status:'success',
            results:result.rowCount,
            data:result.rows
        })
    }
    catch(err){
        next(err)
    }

})

app.post("/api/scraplog",async(req,res)=>{
    try{
        let {logid,sellerid,metalid,weight,date_recived,qualityid}=req.body;
        const result=await pool.query('INSERT INTO scraplog (logid,sellerid,metalid,weight,date_recived,qualityid) VALUES ($1,$2,$3,$4,$5,$6) RETURNING *',[logid,sellerid,metalid,weight,date_recived,qualityid])
        res.status(201).json(result.rows[0]); 
    }
    catch(err){
        console.error(err);
        res.status(500).send('Database error');
    }
})


app.put("/api/orders/:id",async(req,res)=>{
    let id=req.params.id;
    let status=req.body.status;
    try{
        let result=await pool.query("update orders set status=$2 where orderid=$1 RETURNING *",[id,status])
        res.status(200).json(result.rows);
    }
    catch(err){
        console.error(err.message);
        res.status(500).send("server error");
    }
})

// global error catcher
app.use((err,req,res,next)=>{
    console.error(err.message);
    res.status(500).json({
        status:'error',
        message:'interal server error'
    })
})


// server starting
pool.query('select now()',(err,res)=>{
    if(err){
        console.err("the connection failed")
        process.exit(1);
    }
    else{
        console.log("connection is sucessful")
        app.listen(process.env.PORT,()=>{
            console.log(`conection is established on port${process.env.PORT}`)
        })
    }
})
