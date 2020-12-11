const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./db");


//middelware
app.use(cors());
app.use(express.json());


//RUTAS// 

//create un cliente_natural

app.post("/cliente_natural", async(req,res) => {

    try{

        //console.log(req.body);
        
        const { cl_nombre } = req.body;
        const newCliente_natural = await pool.query(
            "INSERT INTO cliente_natural (cl_nombre) VALUES($1) RETURNING *",
            [cl_nombre]
        );

        res.json(newCliente_natural.rows[0]);


    } catch(err){
        console.error(err.message);
    }

})

 //get all cliente_natural

 app.get("/cliente_natural", async(req,res) => {

    try{

       const allClientes_naturales = await pool.query("SELECT * FROM cliente_natural");
       res.json(allClientes_naturales.rows)


    } catch(err){
        console.error(err.message);
    }

})

 //get a cliente_natural

 app.get("/cliente_natural/:cl_id", async(req,res) => {

    try{
        const {cl_id} = req.params;
        const Cliente_natural = await pool.query("SELECT * FROM cliente_natural WHERE cl_id = $1", [
            cl_id
        ]);     

        res.json(Cliente_natural.rows[0]);

    } catch(err){
        console.error(err.message);
    }

});

 //update a cliente_natural

 app.put("/cliente_natural/:cl_id", async(req,res) => {

    try{

        const {cl_id} = req.params;
        const {cl_nombre} = req.body;
        const updateCliente_natural = await pool.query(
            "UPDATE cliente_natural SET cl_nombre = $1 WHERE cl_id = $2", 
            [cl_nombre,cl_id]
        );

        res.json("cliente_natural actualizado");


    } catch(err){
        console.error(err.message);
    }

})

 //delete a cliente_natural
 
 app.delete("/cliente_natural/:cl_id", async(req,res) => {

    try{

        const {cl_id} = req.params;
        const deleteCliente_natural = await pool.query("DELETE FROM cliente_natural WHERE cl_id = $1",[
            cl_id
        ]);


        res.json("cliente_natural $1 fue eliminado",[cl_id]);


    } catch(err){
        console.error(err.message);
    }

})


app.listen(5001, () => {
    console.log("el servidor ha comenzado en puerto 5001")
});
