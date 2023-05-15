import { pool } from "../db.js";

export const getUsers = async(req, res) => {
try {
    const [rows] = await pool.query('SELECT * FROM usuario')
    res.json(rows)
} catch (error) {
    return res.status(500).json({ message: "something went wrong"})
}

}


export const getUser = async(req, res) => {
    const [rows] = await pool.query('SELECT * FROM usuario WHERE COD_USUARIO = ?', [req.params.COD_USUARIO])

    if (rows.length <= 0) return res.status(404).json({ message: 'Not Found' })

    
    res.json(rows[0])
}

export const createUsers = async(req, res) => {
    const {NOMBRES, APELLIDOS, CORREO, CELULAR, FECHA_NACIMIENTO, CONTRASENA} = req.body;

    const [rows] = await pool.query('INSERT INTO usuario(NOMBRES, APELLIDOS, CORREO, CELULAR, FECHA_NACIMIENTO, CONTRASENA) VALUES (?,?,?,?,?,?)', [NOMBRES, APELLIDOS, CORREO, CELULAR, FECHA_NACIMIENTO, CONTRASENA]) 

    res.send({
        id: rows.insertId,
        NOMBRES,
        APELLIDOS,
        CORREO,
        CELULAR,
        FECHA_NACIMIENTO,
        CONTRASENA
    })
}

export const deleteUsers = async(req, res) =>{
    const [result] = await pool.query('DELETE FROM usuario WHERE COD_USUARIO = ?', req.params.COD_USUARIO)

    if (result.affectedRows <= 0) return res.status(404).json({message: "Not found"})

    console.log(result)
    res.sendStatus(204)
}

export const updateUsers = async(req, res) =>{
    const {COD_USUARIO} = req.params
    const {NOMBRES, APELLIDOS, CORREO, CELULAR, FECHA_NACIMIENTO, CONTRASENA} = req.body

    const [result] = await pool.query('UPDATE usuario SET NOMBRES = IFNULL(?, NOMBRES), APELLIDOS = IFNULL(?, APELLIDOS), CORREO = IFNULL(?, CORREO), CELULAR = IFNULL(?, CELULAR), FECHA_NACIMIENTO = IFNULL(?, FECHA_NACIMIENTO), CONTRASENA = IFNULL(?, CONTRASENA) WHERE COD_USUARIO = ?', [NOMBRES, APELLIDOS, CORREO, CELULAR, FECHA_NACIMIENTO, CONTRASENA, COD_USUARIO])

    if (result.affectedRows === 0) return res.status(404).json({message: "Not Found"}) 

    const [rows] = await pool.query('SELECT * FROM usuario WHERE COD_USUARIO = ?', [COD_USUARIO])

    console.log(result)
    res.json(rows[0])
}

