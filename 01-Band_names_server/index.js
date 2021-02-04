const express = require('express');
const app = express();

app.listen(300,(err)=>{
    if(err) throw new Error(err);
    console.log('Servidor corriendo en puerto',3000)
})
