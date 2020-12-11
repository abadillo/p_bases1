const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./db");


//middelware
app.use(cors());
app.use(express.json());

app.listen(5000, () => {
    console.log("el servidor ha comenzado en puerto 5000")
});


//RUTAS//

//create un todo

app.post ("/todos", async(req,res) => {

    try{

        //console.log(req.body);
        
        const { descripcion } = req.body;
        const newTodo = await pool.query(
            "INSERT INTO todo (descripcion) VALUES($1) RETURNING *",
            [descripcion]
        );

        res.json(newTodo.rows[0]);


    } catch(err){
        console.error(err.message);
    }

})



 //get all todos


 app.get("/todos", async(req,res) => {

    try{

       const allTodos = await pool.query("SELECT * FROM todo");
       res.json(allTodos.rows)


    } catch(err){
        console.error(err.message);
    }

})


 //get a todo

 app.get("/todos/:id", async(req,res) => {

    try{
        const {id} = req.params;
        const todo = await pool.query("SELECT * FROM todo WHERE todo_id = $1", [
            id
        ]);     

        res.json(todo.rows[0]);

    } catch(err){
        console.error(err.message);
    }

});

 //update a todo

 app.put ("/todos/:id", async(req,res) => {

    try{

        const {id} = req.params;
        const {descripcion} = req.body;
        const updateTodo = await pool.query(
            "UPDATE todo SET descripcion = $1 WHERE todo_id = $2", 
            [descripcion,id]
        );

        res.json("todo actualizado");


    } catch(err){
        console.error(err.message);
    }

})

 //delete a todo
 
 app.delete("/todos/:id", async(req,res) => {

    try{

        const {id} = req.params;
        const deleteTodo = await pool.query("DELETE FROM todo WHERE todo_id = $1",[
            id
        ]);


        res.json("todo fue eliminado");


    } catch(err){
        console.error(err.message);
    }

})

