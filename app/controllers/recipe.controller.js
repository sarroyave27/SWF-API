import { pool } from "../db.js";

export const getAllRecipes = async (req, res) => {
    try {
        const [rows] = await pool.query(`CALL spGetRecipe()`);
        res.json(rows);
    } catch (error) {
        console.log(error);
    }
}