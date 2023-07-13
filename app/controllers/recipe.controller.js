import { pool } from "../db.js";
// Función para obtener todas las recetas
export const getAllRecipes = async (req, res) => {
    try {
        const [rows] = await pool.query(`CALL spFindAllRecipes()`);
        res.json(rows);
    } catch (error) {
        console.log(error);
    }
}
// Función para desactivar una receta
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

// Función para crear una nueva receta
export const createRecipe = async (req, res) => {
    const {NOMBRE,DESCRIPCION,INGREDIENTES} = req.body
    try {
        const result = await pool.query(`CALL spCreateRecipes('${NOMBRE}','${DESCRIPCION}','${INGREDIENTES}')`);
        res.json(result);
    } catch (error) {
        console.log(error);
    }
}
// Función para actualizar una receta
export const updateRecipe = async (req, res) => {
    try {
        const { COD_RECETA } = req.params
        const { NOMBRE, DESCRIPCION } = req.body
        
        const result = await pool.query(`CALL spEditRecipes(${COD_RECETA},'${NOMBRE}','${DESCRIPCION}')`)
        
        if(result[0].affectedRows != 0)
            res.json(result);
        else
            res.json({"ERROR":"no actualizo"});
    } catch (error) {
        console.error("ERROR: "+error)
        
    }
}