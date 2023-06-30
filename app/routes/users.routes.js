import { Router } from "express";
import * as controllers from "../controllers/users.controller.js"

const router = Router();

  router.get("/users", controllers.getUsers) 

  router.get("/users/:COD_USUARIO", controllers.getUser) 

  router.post("/users", controllers.createUsers) 
  
  router.patch("/users/:COD_USUARIO", controllers.disableUser)

  router.post("/consult", controllers.consultUser) 
  
export default router;

