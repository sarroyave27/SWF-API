import { pool } from "../db.js";

export const getAllRecipes = async (req, res) => {
    try {
        const [rows] = await pool.query(`CALL spGetRecipe()`);
        res.json(rows);
    } catch (error) {
        console.log(error);
    }
}

export const disableRecipe = async (req, res) => {
    const {COD_RECETA} = req.params
    const {ESTADO} = req.body
    try {
        const result = await pool.query(`CALL spDisableRecipe(${COD_RECETA},${ESTADO})`)
        if (result[0].affectedRows == 1) {
            console.log("Estado afectado");
            res.json(result[0])
        } else
            res.json({ "msg": "No Actualizó" })
    } catch (error) {
        console.error(error);
    }
}