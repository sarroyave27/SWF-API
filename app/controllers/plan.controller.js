import { pool } from "../db.js";

export const findAPlan = async(req,res) => {
    const {COD_PLAN} = req.params
    try {
        const [rows] = await pool.query(`CALL spFindAPlan(${COD_PLAN})`)
        res.json(rows[0])
    } catch (error) {
        console.error("Ha ocurrido un error");
    }
}
export const findAllPlans = async(req,res) => {
    try {
        const [rows] = await pool.query(`CALL spFindAllPlans()`);
        res.json(rows);
    } catch (error) {
        console.log(error);
    }
}
export const editPlan = async(req,res) => {
    const {COD_PLAN} = req.params
    const {DESCRIPCION, ESTADO} = req.body
    try {
        const result = await pool.query(`CALL spEditPlan(${COD_PLAN},'${DESCRIPCION}',${ESTADO})`)
        if (result[0].affectedRows != 0) {
            res.json(result[0])
        } else
            res.json({ "msg": "No Actualizó" })
    } catch (error) {
        console.error(error);
    }
}
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

export const findAllPlanUser = async(req,res) => {
    try {
        const [rows] = await pool.query(`call spGetAllPlanUser()`);
        res.json(rows);
    } catch (error) {
        console.log(error);
    }
}