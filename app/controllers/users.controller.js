import { pool } from "../db.js";

export const getUser = async (req, res) => {
    const {COD_USUARIO} = req.params
    try {
        const [rows] = await pool.query(`CALL spFindUser(${COD_USUARIO})`)
        res.json(rows[0])
    } catch (error) {
        console.error("Ha ocurrido un error");
    }
}

export const consultUser = async (req, res) => {
    const {CORREO, CONTRASENA} = req.body
    try {
        const [rows] = await pool.query(`CALL spConsultUser('${CORREO}','${CONTRASENA}')`)
        res.json(rows[0])
    } catch (error) {
        console.error("Ha ocurrido un error");
    }
}
export const getUsers = async (req, res) => {
    try {
        const [rows] = await pool.query(`CALL spFindAllUsers()`);
        res.json(rows);
    } catch (error) {
        console.log(error);
    }
}

export const createUsers = async (req, res) => {
    const {NOMBRES,APELLIDOS, CORREO, CELULAR, FECHA_NACIMIENTO,CONTRASENA,COD_ROL} = req.body
    try {
        const result = await pool.query(`CALL spCreateUsers('${NOMBRES}','${APELLIDOS}','${CORREO}',${CELULAR},'${FECHA_NACIMIENTO}','${CONTRASENA}',${COD_ROL})`);
        res.json(result);
    } catch (error) {
        console.log(error);
    }
}


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




/*
export const updateUsers = async (req, res) => {
    try {
        const { COD_USUARIO } = req.params
        const { NOMBRES, APELLIDOS, CORREO, CELULAR, FECHA_NACIMIENTO, CONTRASENA } = req.body
        
        const [result] = await pool.query('UPDATE usuario SET NOMBRES = IFNULL(?, NOMBRES), APELLIDOS = IFNULL(?, APELLIDOS), CORREO = IFNULL(?, CORREO), CELULAR = IFNULL(?, CELULAR), FECHA_NACIMIENTO = IFNULL(?, FECHA_NACIMIENTO), CONTRASENA = IFNULL(?, CONTRASENA) WHERE COD_USUARIO = ?', [NOMBRES, APELLIDOS, CORREO, CELULAR, FECHA_NACIMIENTO, CONTRASENA, COD_USUARIO])
        
        if (result.affectedRows === 0) return res.status(404).json({ message: "Not Found" })
        
        const [rows] = await pool.query('SELECT * FROM usuario WHERE COD_USUARIO = ?', [COD_USUARIO])
        
        console.log(result)
        res.json(rows[0])
    } catch (error) {
        return res.status(500).json({ message: "something went wrong" })
        
    }
}
*/
