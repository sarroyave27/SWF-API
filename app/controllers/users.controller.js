import { pool } from "../db.js";
// Función para obtener un usuario por su código
export const getUser = async (req, res) => {
    const {COD_USUARIO} = req.params
    try {
        const [rows] = await pool.query(`CALL spFindUser(${COD_USUARIO})`)
        res.json(rows[0])
    } catch (error) {
        console.error("Ha ocurrido un error");
    }
}
// Función para consultar un usuario por correo electrónico y contraseña
export const consultUser = async (req, res) => {
    const {CORREO, CONTRASENA} = req.body
    try {
        const [rows] = await pool.query(`CALL spConsultUser('${CORREO}','${CONTRASENA}')`)
        res.json(rows[0])
    } catch (error) {
        console.error("Ha ocurrido un error");
    }
}
// Función para obtener todos los usuarios
export const getUsers = async (req, res) => {
    try {
        const [rows] = await pool.query(`CALL spFindAllUsers()`);
        res.json(rows);
    } catch (error) {
        console.log(error);
    }
}
// Función para crear un nuevo usuario
export const createUsers = async (req, res) => {
    const {NOMBRES,APELLIDOS, CORREO, CELULAR, FECHA_NACIMIENTO,CONTRASENA,COD_ROL} = req.body
    try {
        const result = await pool.query(`CALL spCreateUsers('${NOMBRES}','${APELLIDOS}','${CORREO}',${CELULAR},'${FECHA_NACIMIENTO}','${CONTRASENA}',${COD_ROL})`);
        res.json(result);
    } catch (error) {
        console.log(error);
    }
}

// Función para desactivar un usuario
export const disableUser = async (req, res) => {
    const {COD_USUARIO} = req.params
    const {ESTADO} = req.body
    try {
        const result = await pool.query(`CALL spDisableUser(${COD_USUARIO},${ESTADO})`)
        if (result[0].affectedRows == 1) {
            console.log("Estado afectado");
            res.json(result[0])
        } else
            res.json({ "msg": "No Actualizó" })
    } catch (error) {
        console.error(error);
    }
}



