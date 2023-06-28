import { Router } from "express";
import * as controllers from "../controllers/recipe.controller.js"

const router = Router();

router.get("/AllRecipe", controllers.getAllRecipes);

export default router;