import { Router } from "express";
import * as controllers from "../controllers/recipe.controller.js"

const router = Router();
// Ruta para obtener todas las recetas
router.get("/AllRecipe", controllers.getAllRecipes);
// Ruta para desactivar una receta
router.patch("/rec/:COD_RECETA", controllers.disableRecipe)
// Ruta para crear una nueva receta
router.post("/rec", controllers.createRecipe) 
// Ruta para actualizar una receta
router.patch("/rec/:COD_RECETA", controllers.updateRecipe)

export default router;