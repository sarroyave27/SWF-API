import { Router } from "express";
import { getUsers, getUser, createUsers, updateUsers, deleteUsers } from "../controllers/users.controller.js";

const router = Router();

  router.get("/users", getUsers) 

  router.get("/users/:COD_USUARIO", getUser) 

  router.post("/users", createUsers) 
  
  router.patch("/users/:COD_USUARIO", updateUsers)
  
  router.delete("/users/:COD_USUARIO", deleteUsers)
  
export default router;

