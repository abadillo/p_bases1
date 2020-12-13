import React, {Fragment, useState} from "react";

const IngresarCliente_natural = () => {
    
    const [cl_nombre, setnombre] = useState("react");

    const onSubmitForm = async(e) => {
        e.preventDefault();
        try {
            const body = { cl_nombre };
            const response = await fetch("http://localhost:5001/cliente_natural", {
                method: "POST",
                headers: { "Content-Type": "application/json"},
                body: JSON.stringify(body)
            });

            console.log(body);
        

        } catch (err) {
            console.error(err.message)
        }
    }
    
    return(
        <Fragment>
            <h1 className = "text-center mt-5">Lista de Clientes Naturales</h1>
            <form className="d-flex mt-5" onSubmit={onSubmitForm}>
                <input 
                    type="text" 
                    className="from-control" 
                    value={cl_nombre} 
                    onChange= {e => setnombre(e.target.value)
                    }
                />
                <button className="btn btn-succes">Añadir</button>
            </form>
        </Fragment>
    );
};

export default IngresarCliente_natural;

