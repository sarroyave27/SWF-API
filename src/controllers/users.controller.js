import { pool } from "../db.js";

export const getUser = async (req, res) => {
    const COD_USUARIO = req.params.COD_USUARIO
    try {
        const [rows] = await pool.query(`CALL spFindUser(${COD_USUARIO})`)
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
    const nombres = req.body.NOMBRES;
    const apellidos = req.body.APELLIDOS;
    const correo = req.body.CORREO;
    const celular = req.body.CELULAR;
    const fecha_nacimiento = req.body.FECHA_NACIMIENTO;
    const contrasena = req.body.CONTRASENA;

    try {
        const result = await pool.query(`CALL spCreateUsers('${nombres}','${apellidos}','${correo}',${celular},'${fecha_nacimiento}','${contrasena}')`);
        res.json(result);
    } catch (error) {
        console.log(error);
    }
}

export const deleteUsers = async (req, res) => {
    try {
        const [result] = await pool.query('DELETE FROM usuario WHERE COD_USUARIO = ?', req.params.COD_USUARIO)

        if (result.affectedRows <= 0) return res.status(404).json({ message: "Not found" })
        console.log(result)
        res.sendStatus(204)
    } catch (error) {
        return res.status(500).json({ message: "something went wrong" })
    }
}

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

