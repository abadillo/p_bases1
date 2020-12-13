import React, {Fragment} from "react";
import './App.css';

//componetnes 

import IngresarCliente_natural from "./components/IngresarCliente_natural";


function App() {
  return(
    <Fragment>
      <div className= "container">
         <IngresarCliente_natural />
      </div>

    </Fragment>
  );
}

export default App;
