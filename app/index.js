import app from "./app.js";
import { PORT } from "./config.js"
// Inicia el servidor y escucha en el puerto especificado
app.listen(PORT); 
// Imprime la URL del servidor en la consola
console.log(`http://localhost:${PORT}`)

