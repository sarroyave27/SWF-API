import { Router } from "express";
import * as controllers from "../controllers/plan.controller.js"

const router = Router();
// Ruta para obtener todos los planes
  router.get("/AllPlans", controllers.findAllPlans)
// Ruta para obtener un plan por su código
  router.get("/Aplan/:COD_PLAN", controllers.findAPlan)
// Ruta para crear un nuevo plan
  router.post("/createPlan", controllers.createPlan)  
// Ruta para editar un plan existente
  router.patch("/Aplan/:COD_PLAN", controllers.editPlan) 
// Ruta para eliminar un plan
  router.delete("/Aplan/:COD_PLAN", controllers.deletePlan)
// Ruta para obtener todos los planes de usuario
  router.get("/AllPlanUser", controllers.findAllPlanUser)
// Ruta para desactivar un plan
  router.patch("/disable/:COD_PLAN", controllers.disablePlan)
// Ruta para actualizar un plan
  router.put("/updatePlan/:COD_PLAN", controllers.updatePlan);

export default router;