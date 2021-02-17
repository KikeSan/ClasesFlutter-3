const {io} = require('../index')
// mensajes de sockets
io.on('connection', client => {
    console.log('Cliente conectado');

    client.on('disconnect', () => {
        console.log('Cliente desconectado!')
    });

    client.on('mensaje',(payload)=>{
        console.log('Mensaje!!!',payload)
        io.emit('desde el server',{puerto:3001})
    })

    client.on('emitir-mensaje',(payload)=>{
        // emite a todos menos al que lo emitió
        client.broadcast.emit('nuevo-mensaje','HEY!!!!')
    })

});
