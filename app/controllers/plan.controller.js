import { pool } from "../db.js";
// Función para encontrar un plan por su código
export const findAPlan = async(req,res) => {
    const {COD_PLAN} = req.params
    try {
        const [rows] = await pool.query(`CALL spFindAPlan(${COD_PLAN})`)
        res.json(rows[0])
    } catch (error) {
        console.error("Ha ocurrido un error");
    }
}
// Función para crear un nuevo plan
export const createPlan = async(req,res) => {
    const {NOMBRE,DESCRIPCION,TELEFONO} = req.body
    try {
        const result = await pool.query(`CALL spCreatePlan('${NOMBRE}','${DESCRIPCION}',${TELEFONO})`);
        res.json(result);
    } catch (error) {
        console.log(error);
    }
}
// Función para encontrar todos los planes
export const findAllPlans = async(req,res) => {
    try {
        const [rows] = await pool.query(`CALL spFindAllPlans()`);
        res.json(rows);
    } catch (error) {
        console.log(error);
    }
}
// Función para editar un plan
export const editPlan = async(req,res) => {
    const {COD_PLAN} = req.params
    const {DESCRIPCION,TELEFONO, ESTADO} = req.body
    try {
        const result = await pool.query(`CALL spEditPlan(${COD_PLAN},'${DESCRIPCION}', ${TELEFONO},${ESTADO})`)
        if (result[0].affectedRows != 0) {
            res.json(result[0])
        } else
            res.json({ "msg": "No Actualizó" })
    } catch (error) {
        console.error(error);
    }
}
// Función para eliminar un plan
export const deletePlan = async(req,res) => {
    const {COD_PLAN} = req.params
    try {
        const result = await pool.query(`CALL spDeletePlan(${COD_PLAN})`)
        if (result[0].affectedRows == 1) {
            res.json({ "msg": "Borrado Correctamente"})
        } else
            res.json({ "msg": "No se pudo borrar"})
    } catch (error) {
        console.error(error);
    }
}

// Función para encontrar todos los planes de usuario
export const findAllPlanUser = async(req,res) => {
    try {
        const [rows] = await pool.query(`call spGetAllPlanUser()`);
        res.json(rows);
    } catch (error) {
        console.log(error);
    }
}
// Función para desactivar un plan
export const disablePlan = async (req, res) => {
    const {COD_PLAN} = req.params
    const {ESTADO} = req.body
    try {
        const result = await pool.query(`CALL spDisablePlan(${COD_PLAN},${ESTADO})`)
        if (result[0].affectedRows == 1) {
            console.log("Estado afectado");
            res.json(result[0])
        } else
            res.json({ "msg": "No Actualizó" })
    } catch (error) {
        console.error(error);
    }
}
// Función para actualizar un plan
export const updatePlan = async (req, res) => {
    const {COD_PLAN} = req.params
    const {NOMBRE,DESCRIPCION,TELEFONO} = req.body
    try {
        const result = await pool.query(`CALL spUpdatePlan(${COD_PLAN},'${NOMBRE}','${DESCRIPCION}','${TELEFONO}')`)
        if (result[0].affectedRows == 1) {
            console.log("Plan afectado");
            res.json(result[0])
        } else
            res.json({ "msg": "No Actualizó" })
    } catch (error) {
        console.error(error);
    }
}