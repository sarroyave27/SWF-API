import { Router } from "express";
//import { getUsers, getUser, createUsers, updateUsers, deleteUsers } from "../controllers/users.controller.js";
import * as controllers from "../controllers/users.controller.js"

const router = Router();

  router.get("/users", controllers.getUsers) 

  router.get("/users/:COD_USUARIO", controllers.getUser) 

  router.post("/users", controllers.createUsers) 
  
  router.patch("/users/:COD_USUARIO", controllers.createUsers)
  
  router.delete("/users/:COD_USUARIO", controllers.deleteUsers)
  
export default router;

