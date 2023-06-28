import { Router } from "express";
import * as controllers from "../controllers/plan.controller.js"

const router = Router();

  router.get("/AllPlans", controllers.findAllPlans)

  router.get("/Aplan/:COD_PLAN", controllers.findAPlan)

  router.post("/createPlan", controllers.createPlan)  

  router.patch("/Aplan/:COD_PLAN", controllers.editPlan) 

  router.delete("/Aplan/:COD_PLAN", controllers.deletePlan)

  router.get("/AllPlanUser", controllers.findAllPlanUser)
export default router;