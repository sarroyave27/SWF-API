import { Router } from "express";
import * as controllers from "../controllers/recipe.controller.js"

const router = Router();

router.get("/AllRecipe", controllers.getAllRecipes);
router.patch("/rec/:COD_RECETA", controllers.disableRecipe)
router.post("/rec", controllers.createRecipe) 
router.patch("/rec/:COD_RECETA", controllers.updateRecipe)

export default router;