import { pool } from "../db.js";
// Función para realizar un ping a la base de datos
export const ping = async (req, res) => {
  // Realizar una consulta a la base de datos para obtener el resultado "Pong"
    const [result] = await pool.query('SELECT "Pong" AS RESULT')
    // Enviar el resultado como respuesta en formato JSON
    res.json(result)
  }